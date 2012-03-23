require "spec_helper"

describe OrderMailer do
  describe "status change"
    before(:each) do
      @order = FactoryGirl.create(:order)
    end
    
    it "should render succesfully" do
      lambda { OrderMailer.status_change(@order).should_not raise_error }
    end
    
    describe "rendered without error" do
      before(:each) do
        @mailer = OrderMailer.status_change(@order)
      end
      
      it "should have an customer name" do
         @mailer.body.should have_content(@order.user.name.to_s)
      end
      
      it "should deliver succesfully"  do 
        lambda {@mailer.deliver}.should_not raise_error 
      end
      
      describe "and deliver" do
         it "should be added to the delivery queue" do
           lambda { @mailer.deliver }.should change(ActionMailer::Base.deliveries,:size).by(1)
         end
      end
   end
end
