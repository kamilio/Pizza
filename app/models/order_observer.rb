class OrderObserver < ActiveRecord::Observer
  def after_order(order,transition)
    OrderMailer.status_change(order).deliver
  end
end