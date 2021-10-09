class OrderHistoriesController < ApplicationController

  def index
    @order_history_address = OrderHistoryAddress.new
  end

  def create
    #binding.pry
    @order_history_address = OrderHistoryAddress.new(order_history_params)
    if @order_history_address.valid?
      @order_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_history_params

    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_history_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end



end
