class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end 
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :telephone, :order_id).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],
          currency: 'jpy'
        )
  end

end