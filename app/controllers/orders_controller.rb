class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new(order_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
    else
      render :index 
    end
  end

  private

  def order_params
    params.require(:buyer).permit(:postal_code, :prefecture_id, :city , :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end