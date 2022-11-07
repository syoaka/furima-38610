class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
  end

  def create
    @shipping = ShippingAddress.create(shipping_address_params)
  end

end

private

  def shipping_address_params
    params.permit(:post_code, :prefecture_id, :city, :address1, :address2, :telephone).merge(:order_id)
  end
