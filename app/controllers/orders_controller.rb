class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

end

private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :telephone, :order_id, :item_id).merge(item_id: @item.id, user_id: current_user.id)
  end
