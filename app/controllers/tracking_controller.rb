class TrackingController < ApplicationController
  load_and_authorize_resource :order
  
  def index
    @orders = Order.where(
      :user_id => current_user.id
      )
  end

  def show
    @order = Order.find(params[:id].to_i)
    @history = @order.order_histories
  end
end