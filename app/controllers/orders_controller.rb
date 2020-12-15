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
      @buyer.save
      redirect_to root_path
    else
      render :index 
    end
  end

  private

  def order_params
    params.require(:buyer).permit(:postal_code, :prefecture_id, :city , :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end