class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.order
    @form_order = FormOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @form_order = FormOrder.new(form_order_params)
    if @form_order.valid?
      pay_item
      @form_order.save
      redirect_to root_path
    else
      @form_order.zip_code = nil
      @form_order.forwarding_origin_id = nil
      @form_order.municipality = nil
      @form_order.address = nil
      @form_order.building_name = nil
      @form_order.phone_number = nil
      @form_order.token = nil
      render :index
    end
  end

  private

  def form_order_params
    params.require(:form_order).permit(:price, :zip_code, :forwarding_origin_id, :municipality,
                                       :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: form_order_params[:token], # カードトークン
      currency: 'jpy'                 # 日本円
    )
  end
end
