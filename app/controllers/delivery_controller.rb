class DeliveryController < ApplicationController
  load_and_authorize_resource :order
  def index
    @orders = Order.find_all_by_status(:ready)
  end

  def deliver
    order = Order.find_by_id(params[:order_id])
    order.change_status(:delivered)
    redirect_to delivery_index
  end
end
