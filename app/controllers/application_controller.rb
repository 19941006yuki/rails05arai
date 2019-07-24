class ApplicationController < ActionController::Base
=begin
applicationcontroller はroute設定しなくてもデフォルトで読み込まれる。
ActionController ::base　＝便利なメソッドが多く定義されている。  
=end
  
  protect_from_forgery with: :exception
=begin
protect_from_forgery(偽装)with: :exception
セキュリティトークン（ワンタイムパスワードを生成するためのソフトウェアや機械の事）が自動的に取り込まれる
？ActionController::Baseにはprotect_from_forgery with: :exceptionが無いから追加している？
=end
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?
#コントローラのメソッドをヘルパーとしてビューに記載
#コントローラに記載したメソッドを、ビューで使えるようにする。
#ヘルパーの役割=viewをシンプルにする。Viewとは別の場所（helper）にメソッドを書いておき、
#Viewから呼び出すことが出来る。

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
=begin 今ログインしているユーザを返すメソッド
=end
  def logged_in?
    !current_user.nil?
  end
=begin ユーザがログインしていれば(nilじゃなければ)true、
その他ならfalseを返す
=end
end
