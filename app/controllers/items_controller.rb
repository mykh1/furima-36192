class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
  
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect to new_item_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category, :condition, :shipping_cost, :prefecture, :shipping_day, :price, :image).merge(user_id: current_user.id)
  end

end
