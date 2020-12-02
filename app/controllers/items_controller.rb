class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end 

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show

  end

  def edit

  end

  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
     end
     redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :prefecture_id, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id])
  end

end
