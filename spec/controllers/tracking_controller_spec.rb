require "spec_helper"

describe TrackingController do
  before(:each) do
    @user = FactoryGirl.create(:user) 
    controller.stub(:current_user).and_return @user 
  end
  
  describe "GET index" do
      def do_get
        get :index
      end
    it "should respond with code 200" do
      do_get
      response.should be_success
    end
    it "should render template" do
      do_get
      response.should render_template("index")
    end
  end
  
  describe "GET show" do
    before(:each) do
      @order = FactoryGirl.create(:order) 
    end
    
    def do_get
      get :show, :id => @order.id
    end
    
    it "should respond with code 200" do
      do_get
      response.should be_success
    end
      
    it "should show tracking page for one order" do
      do_get
      response.should render_template("show")
    end
  end
end