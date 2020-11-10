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
      Payjp.api_key = "sk_test_5e659af50d7629dc022726e3"
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: "jpy"
      )
      @transaction.save
        redirect_to root_path
      else
        render action: "index"
      end
  end

  private

  def order_params
    params.require(:transaction).permit(:postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order
      redirect_to root_path
    elsif current_user.id ==  @item.user_id
      redirect_to root_path
    end
  end
end
