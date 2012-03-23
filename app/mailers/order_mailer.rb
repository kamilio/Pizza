class OrderMailer < ActionMailer::Base
  default :from => "Awesome Pizza <super-pizza@example.com>"
  
  def status_change(order)
    @order = order
    mail(:to => order.user.email, :subject => "Order changed the status")
  end
end
