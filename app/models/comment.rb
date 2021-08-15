class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
  #バリデーション データが正しいか判定する
  validates :text, presence: true 
end
