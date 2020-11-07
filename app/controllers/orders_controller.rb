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

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.order
      redirect_to root_path
    elsif current_user.id ==  @item.user_id
      redirect_to root_path
    end
  end
end
