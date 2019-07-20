class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
=begin
Activerecord = データベースに恒久的に保存される必要のある
ビジネスオブジェクトの作成と利用を円滑に行なえるようにする。
ActiveRecord::Base を継承したクラスをモデルとして作成すると、
Rails はそのクラス名に対応したデータベースのテーブルを自動的に探そうとします。
対応するデータベースのテーブルを用意しない場合は、self.abstract_class = true を書く必要があります。
ActiveRecord::Base を継承したクラスを作成し、
さらにそのクラスを継承させたい場合に self.abstract_class = true を書く。
self.abstract_class = trueと記載しておかないと
hoge.base　というテーブルを探してしまう。
=end

end
