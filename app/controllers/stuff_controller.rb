class StuffController < ApplicationController
  load_and_authorize_resource :order
  
  def index
    @orders_ordered = Order.find_all_by_status(:ordered)
    @orders_accepted = Order.find_all_by_status(:accepted)
  end

  def accept
    order = Order.find_by_id(params[:order_id])
    order.change_status(:accepted)
    redirect_to stuff_index_path
  end

  def ready
    order = Order.find_by_id(params[:order_id])
    order.change_status(:ready)
    redirect_to stuff_index_path
  end
end
