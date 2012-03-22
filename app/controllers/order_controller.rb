class OrderController < ApplicationController
  before_filter :require_address
  load_and_authorize_resource :order
  
  def summary   
    @order = Order.find(params[:order_id])
    if Shop.closed?
      @order.cancel 
      redirect_to root_path
    end
  end
 
  def proceed
    @order = Order.find(params[:order_id])
    @order.order
    redirect_to order_ordered_path(:order_id => params[:order_id])
  end
  
  def ordered
    @order = Order.find(params[:order_id])
    @user = current_user
  end
end
