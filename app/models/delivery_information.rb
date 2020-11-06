class DeliveryInformation < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :forwarding_origin

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :zip_code
    validates :forwarding_origin_id
    validates :municipality
    validates :address
    validates :phone_number
  end

end
