class UsersController < ApplicationController
  def new
    @user = User.new
  end
=begin
＠＝インスタンス変数＝クラスのスコープ外で使用できるもの
=end
  def create
    @user = User.new(user_params)
=begin
フィルターしたデータからユーザ生成。
指定したパラメータ以外はシャットアウト
=end
    if @user.save
      redirect_to root_path , success: '登録が完了しました'
=begin
/ を表示させ、successアクションを実行する。successアクションはどこにある？
=end
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
=begin
Action内で、呼び出すViewを指定するメソッド。newビューぺージを呼び出している。
=end
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
=begin
priveteを使ったメソッドはクラス外部から呼び出せないメソッド
=end