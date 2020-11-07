class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @order = Order.new
    @transaction = Transaction.new
  end

  def create
    # @order = Order.new(user_id: current_user.id, item_id: params[:item_id])
    # @order.save
    # ShippingAddress.create(shipping_address_params(@order))
    # binding.pry
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(order_params)
      if @transaction.valid?
        @transaction.save
        redirect_to root_path
      else
        render action: "index"
      end
  end

  private

  def order_params
    params.require(:transaction).permit(:postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def shipping_address_params(order)
  #   params.permit(:postal_code, :prefecture_id, :city, :block, :building, :telephone_number).merge(order_id: @order.id)
  # end
end
