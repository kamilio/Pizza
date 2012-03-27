require "spec_helper"
describe ItemsController do
  before(:each) { do_login_admin }
  
  it "should redirect somewhere" do
    post :create, :item => FactoryGirl.attributes_for(:item)
    response.should redirect_to(items_path)
  end
  
  it "should create a new item" do
    lambda do 
      post :create, :item => FactoryGirl.attributes_for(:item)
    end.should change(Item, :count).by(1)
  end
  
end
