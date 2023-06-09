class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :check_item_availability, only: [:index, :create]

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      # pay_item
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_exists?
    Order.exists?(item_id: @item.id)
  end

  def check_item_availability
    return unless order_exists? || current_user == @item.user

    redirect_to root_path
  end

  def order_params
    params.require(:order_shipment).permit(:postal_code, :city, :addresses, :prefecture_id, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  # def pay_item
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: @item.price, # 商品の値段     , token: params[:token]
  #     card: order_params[:token], # カードトークン
  #     currency: 'jpy' # 通貨の種類（日本円）
  #   )
  # end
end
