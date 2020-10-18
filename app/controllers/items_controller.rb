class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name,:detail,:category_id,:status_id,:cost_burden_id,:ship_from_id,:shipping_day_id,:price)
  end 

  def move_to_new_user_session_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
