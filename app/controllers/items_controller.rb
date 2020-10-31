class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

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

  def show
    @item = Item.find(item_params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:detail,:category_id,:status_id,:cost_burden_id,:ship_from_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end 
end
