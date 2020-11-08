class FormOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :forwarding_origin_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  
  # 空の投稿を保存できないようにする
  with_options presence: true do
    # validates :price
    validates :zip_code,             format:       { with: /\A\d{3}[-]\d{4}\z/, message: 'は「-(ﾊｲﾌﾝ)」ありで入力してください' }
    validates :forwarding_origin_id, numericality: { other_than: 1, message: 'は「---」以外を選択してください' }
    validates :municipality
    validates :address
    validates :phone_number,         format:       { with: /\A\d{11}\z/, message: 'は「-(ﾊｲﾌﾝ)」なしで入力してください' }
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    # @order = Order.new(user_id: user_id, item_id: item_id)
    # @order.save

    # @delivery_information = DeliveryInformation.new(zip_code: zip_code, forwarding_origin_id: forwarding_origin_id, municipality: municipality,
    #   address: address, building_name: building_name, phone_number: phone_number, order_id: @order.id)
    # @delivery_information.save
    @delivery = DeliveryInformation.create(zip_code: zip_code, forwarding_origin_id: forwarding_origin_id, municipality: municipality,
                               address: address, building_name: building_name, phone_number: phone_number, order_id: @order.id)
  end

  end