class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Transaction.new(order_params)
    @order.save
  end

  private

  def order_params
    params.require(:transaction).permit(:user_id, :item_id, :postal_code, :prefecture, :city, :block, :building, :telephone_number, :order_id)
  end
end
