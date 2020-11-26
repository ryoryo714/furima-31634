class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end 

  private

  def item_params
    params.require(:item).permit(:name, :prefecture_id)
    params.require(:item).permit(:name, :category_id)
    params.require(:item).permit(:name, :status_id)
    params.require(:item).permit(:name, :shipping_cost_id)
    params.require(:item).permit(:name, :shipping_days_id)

    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
