class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    # @transaction = Transaction.new
  end

  def create
    @order = Order.new(user_id: current_user.id, item_id: params[:item_id])
    @order.save
    # binding.pry
    # @transaction = Transaction.new(order_params)
    # @transaction.save
  end

  private

  def order_params
    # params.require(:transaction).permit(:user_id, :item_id,:postal_code, :prefecture, :city, :block, :building, :telephone_number, :order_id)
  end
end
