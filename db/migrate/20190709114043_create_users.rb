class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
=begin
マイグレーションファイル
データベース作成する際の設計図
一度マイグレーションファイルを使用してテーブルを作ってしまうと、
あとから同じマイグレーションファイルを変更しても反映されなくなるので注意が必要である。
SQLを書くことなくRubyでデータベース内にテーブルを作成することができる機能
Ruby on Rails内のActiveRecordという機能がRubyをSQLに自動翻訳することができるため
=end