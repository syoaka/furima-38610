class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
    
  end

  def create
    binding.pry
  end

end
