class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string      :name,               null: false                 #ユーザー名

      t.string      :title,         null: false                       #名称
      t.text        :catch_copy,    null: false                       #キャッチコピー
      t.text        :concept,       null: false                       #コンセプト
      t.references  :user,          null: false, foreign_key: true    
      t.timestamps
    end
  end
end
