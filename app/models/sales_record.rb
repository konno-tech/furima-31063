class SalesRecord < ApplicationRecord
  belongs_to :order

  # 空の投稿を保存できないようにする
    validates :price, presence: true
end
