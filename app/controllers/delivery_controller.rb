class DeliveryController < ApplicationController
  load_and_authorize_resource :order
  def index
    @orders_ready = Order.find_all_by_status(:ready)
    @orders_taken = Order.find_all_by_status(:taken)
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    @order.deliver
    redirect_to delivery_index_path
  end
  
  def update
    @order = Order.find_by_id(params[:id])
    @order.take
    redirect_to delivery_index_path
  end
end
