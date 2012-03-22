class StuffController < ApplicationController
  load_and_authorize_resource :order
  
  def index
    @orders_ordered = Order.find_all_by_status(:ordered)
    @orders_accepted = Order.find_all_by_status(:accepted)
  end

  def accept
    order = Order.find_by_id(params[:order_id])
    order.accept
    redirect_to stuff_index_path
  end

  def ready
    order = Order.find_by_id(params[:order_id])
    order.finish
    redirect_to stuff_index_path
  end
  
  def refuse
    order = Order.find_by_id(params[:order_id])
    order.refuse
    redirect_to stuff_index_path
  end
end
