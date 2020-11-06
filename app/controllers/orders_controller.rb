class OrdersController < ApplicationController
  def index
    binding.pry
    @item = Item.find(params[:format])
  end
end
