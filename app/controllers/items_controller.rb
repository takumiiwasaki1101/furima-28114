class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new

  end

  def create
    
  end

  private

  def move_to_new_user_session_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
