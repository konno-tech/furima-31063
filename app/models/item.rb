class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge_of_distribution_cost
  belongs_to_active_hash :forwarding_origin
  belongs_to_active_hash :before_forward_date

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id,                    numericality: { other_than: 1, message: 'Select' }
    validates :condition_id,                   numericality: { other_than: 1, message: 'Select' }
    validates :charge_of_distribution_cost_id, numericality: { other_than: 1, message: 'Select' }
    validates :forwarding_origin_id,           numericality: { other_than: 1, message: 'Select' }
    validates :before_forward_date_id,         numericality: { other_than: 1, message: 'Select' }
    validates :price,                          numericality: { only_integer: true, message: 'Half-width number' },
                                               inclusion: { in: 300..9_999_999 }
  end
end
