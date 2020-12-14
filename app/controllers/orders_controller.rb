class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
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
    params.permit(:postal_code, :prefecture_id, :city , :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end