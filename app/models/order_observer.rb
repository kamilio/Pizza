class OrderObserver < ActiveRecord::Observer
  def after_order(order,transition)
    #OrderMailer.status_change(order).deliver
  end
  
  def before_transition(order, transition)
    OrderHistory.create :user => User.current, :order => order, :to => transition.to, :from => transition.from
  end
end
