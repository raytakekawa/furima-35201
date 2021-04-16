class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :image, :shipping_cost_id, :shipping_days_id, :prefecture_id, :status_id, :price).merge(user_id: current_user.id)
  end

end
