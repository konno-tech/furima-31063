class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :delivery_information
  accepts_nested_attributes_for :delivery_information

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :forwarding_origin
end
