class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index

  def index
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(order_params)
    if @transaction.valid?
      pay_item
      @transaction.save
        redirect_to root_path
      else
        render action: "index"
      end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order
      redirect_to root_path
    elsif current_user.id ==  @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:transaction).permit(:postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token],price: Item.find(params[:item_id]).price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: "jpy"
    )
  end

end
