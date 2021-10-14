class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_history_address = OrderHistoryAddress.new
    @item = Item.find(params[:item_id])
    if @item.order_history.present? || current_user.id == @item.user_id
        redirect_to root_path
    end
  end

  def create
    #binding.pry
    @order_history_address = OrderHistoryAddress.new(order_history_params)
    @item = Item.find(params[:item_id])
    if @order_history_address.valid?
      pay_item
      @order_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_history_params
    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_history_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_history_address.token,
      currency: 'jpy'
    )
  end
end
