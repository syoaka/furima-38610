class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
    if @item.user != current_user || @item.order.present?
      redirect_to  root_path
    end
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

    def destroy
      item = Item.find(params[:id])
      if item.user == current_user
        item.destroy
      end
      redirect_to root_path
    end

  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:condition_id,:pay_for_shipping_id,:prefecture_id,:shipping_day_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end