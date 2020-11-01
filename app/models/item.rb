class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  #空の投稿を保存できないようにする
  validates :name, :description, :category_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
end
