require "spec_helper"

describe MenuController do
  describe "when no user is authentificated" do
    describe "GET show" do
      it "should redirect to login page" do
        get :show
        response.should redirect_to login_url
      end
      
      it "should fails to load" do
        get :show
        response.should_not be_success
      end
    end
  end
  
  describe "when a user is authentificated" do
    before(:each) do
      activate_authlogic
      @user = FactoryGirl.create(:user) 
      UserSession.create(@user)
    end
    
    it "should be succesfull" do
      get :show
      response.should be_success
    end
    
    it "should get a cart for current user" do
      get :show
      @user.should_receive(:cart)
    end
  end
end