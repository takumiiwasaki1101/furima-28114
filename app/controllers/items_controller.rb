class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render action: "new"    # バリデーションに弾かれた時
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:detail,:category_id,:status_id,:cost_burden_id,:ship_from_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end 

  def move_to_new_user_session_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
