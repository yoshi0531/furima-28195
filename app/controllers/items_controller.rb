class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create item_params
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end