class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text        :text,        null: false                       #テキスト
      t.references  :user,        null: false, foreign_key: true    #ユーザー
      t.references  :prototype,   null: false, foreign_key: true    #プロトタイプ
      t.timestamps
    end
  end
end
