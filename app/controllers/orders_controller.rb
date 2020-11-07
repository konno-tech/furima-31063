class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
    @form_order = FormOrder.new
  end

  def create
    @form_order = FormOrder.new(form_order_params)
    if @form_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end

  private

  def form_order_params
    params.require(:form_order).permit(:price, :zip_code, :forwarding_origin_id, :municipality,
                   :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)

  end
end
