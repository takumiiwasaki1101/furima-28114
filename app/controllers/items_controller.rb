class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to root_path
    else
      render action: 'new'    # バリデーションに弾かれた時
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    move_to_index
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: 'edit'    # バリデーションに弾かれた時
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :cost_burden_id, :ship_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
