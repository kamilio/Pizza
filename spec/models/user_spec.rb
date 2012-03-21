require 'spec_helper'

describe User do
  it "should create a new instance" do
    User.all.each {|user| puts user.email}
    user = FactoryGirl.build(:guest)
    user.should be_valid
  end
  
  it "should require a login" do
    user = FactoryGirl.build(:user, :login => nil)
    user.login = nil
    user.valid?.should_not == true
  end
  
  it "should require password and passsword_confirmation match" do
    user = FactoryGirl.build(:user, :password_confirmation => "lalala")
    user.should_not be_valid
  end
  
  it "should require unique email address" do
    user = FactoryGirl.create(:user)
    user = FactoryGirl.build(:user, :email => user.email)
    user.should_not be_valid
  end
  
  it "should reject too long names" do
    long_name = "a"*51
    FactoryGirl.build(:user, :login => long_name).should_not be_valid
  end
end
