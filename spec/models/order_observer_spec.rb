require "spec_helper"

describe OrderObserver do
  before(:each) do
    OrderObserver.any_instance.stub(:current_user => FactoryGirl.create(:user))
  end
  it "should create a new order history item" do
    OrderHistory.should_receive(:create)
    @transition = mock "Transition", :from=>"From", :to=>"To"
    OrderObserver.instance.before_transition(FactoryGirl.create(:order), @transition)
  end
end
