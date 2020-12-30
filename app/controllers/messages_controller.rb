class MessagesController < ApplicationController
  before_action :set_item, only: [:create]

def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end