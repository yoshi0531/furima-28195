class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = ItemsTag.new
  end

  def create
    @item = ItemsTag.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @messages = Message.all
    @message = Message.new
  end

  def edit
    if current_user.id == @item.user_id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.order.nil?
      @item.destroy
      redirect_to root_path
    else 
      redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end
  
  private

  def item_params
    params.require(:items_tag).permit(:name, :text, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price, :image, :tag_name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end