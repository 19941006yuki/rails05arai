class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email])
=begin フォームから受け取った情報に重複があるかどうか、一致するユーザがいるかどうかを探す
=end
    if user && user.authenticate(params[:session][:password])
=begin 
「該当のメールアドレスをもつuserが存在している。
かつuserのパスワードが正しい。」場合のみtrueになる条件式です。
=end
      log_in user
      redirect_to root_path, success: "ログインに成功しました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end  
  end
  
  def destroy 
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
=begin
・リダイレクトするときは_urlを使用する。それ以外は_pathを使う
root_path => '/' ※ルート以下の文字列を返す
root_url  => 'http://www.example.com/'　※完全なURLの文字列を返す

help_path => '/help'
help_url  => 'http://www.example.com/help'
_pathは相対パスで、_urlは絶対パスである。
root_url= redirect_to するときのみ。
=end
  private  
=begin
private以下のメソッドはそのクラスでしか利用できない。
→どんな時に使うのか
=paramsを取得するとき。
=before_actionするとき
paramsはURLから送られて来た値やフォームから送られて来た値のパラメーターのこと
ブラウザを一度通して送られて来た値
=end
  def log_in(user)
    session[:user_id] = user.id
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
=begin
userを削除するが、このままだとcurrentuserにユーザ情報が残ったままになるので
nillを代入して、情報を空にする。
=end
  end
  def email_params
    params.require(:session).permit(:email)
  end
  def password_params
    params require(:session).permit(:password)
  end
=begin 許可していない項目に関しては、変更が許可されない
ストロングパラメータ
=end
  
end
