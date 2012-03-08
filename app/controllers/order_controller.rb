class OrderController < ApplicationController
  def proceed
    order = Order.find(params[:order_id])
    order.status = :ordered 
    order.save
    redirect_to order_ordered_path(:order_id => params[:order_id])
  end
  def summary
    @order = Order.find(params[:order_id])
  end
  
  def ordered
    @order = Order.find(params[:order_id])
    @user = current_user
  end
end
