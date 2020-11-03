class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new(order_params)
    # if @item.valid?
    #   @item.save  # バリデーションをクリアした時
    #   redirect_to root_path
    # else
    #   render action: 'new' # バリデーションに弾かれた時
    # end
  end

end
