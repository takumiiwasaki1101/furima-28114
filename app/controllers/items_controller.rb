class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params)
  end

  private

  def params
    params.require(item).permit()
  end 

  def move_to_new_user_session_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
