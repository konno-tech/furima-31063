class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    # ログインユーザーの出品物ではない、もしくは既に売却済みの商品の場合、トップページに遷移する
    redirect_to root_path if current_user.id != @item.user.id || Order.exists?(item_id: @item.id)
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :charge_of_distribution_cost_id,
                                 :forwarding_origin_id, :before_forward_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
