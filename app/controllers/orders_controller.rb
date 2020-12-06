class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_item, only: [:index, :create]
  before_action :move_to_index
  before_action :move_to_top

  def index
    @order = Order.new
  end

  def create
    # binding.pry
    @order = Order.new(order_params)
      if @order.valid?
        pay_item
        @order.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :city, :address, :building_name, :prefecture_id, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_user_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
     redirect_to root_path
    end
  end

  def move_to_top
    if @item.purchase_record.present?
     redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],   
        currency: 'jpy'              
      )
  end

end
