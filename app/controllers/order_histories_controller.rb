class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_history_address = OrderHistoryAddress.new
    if @item.order_history.present? || current_user.id == @item.user_id
        redirect_to root_path
    end
  end

  def create
    @order_history_address = OrderHistoryAddress.new(order_history_params)
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

  def set_item
    @item = Item.find(params[:item_id])
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
