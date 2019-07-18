class User < ApplicationRecord
  validates :name, 
    presence: true,
    length: { maximum: 8 } 
  validates :email, 
    presence: true,
    format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
=begin
そのデータが正しかどうかを検証する仕組み＝バリデーション
=end
  has_secure_password
  validates :password, 
    format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
=begin  
    validates :password_confirmation, 
    format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
=end
=begin  
暗号化されたパスワードをデータベースのpassword_digestというカラムに保存できるようになる。
passwordとpassword_confirmationが使えるようになる。また、存在性と値が一致するかどうかのバリデーション(チェック)も追加される。
引数の文字列がパスワードと一致するとUserオブジェクトを返し、間違っているとfalseを返す
authenticateメソッドが使えるようになる。
 modelに「password」、「password_confirmation」属性の追加
- 「password」、「password_confirmation」のvalidationの追加（値の空白や不一致のチェック）
- authoricateメソッドの追加
=end
end