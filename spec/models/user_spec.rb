require 'spec_helper'

describe User do
  it "should create a new instance" do
    User.all.each {|user| puts user.email}
    user = FactoryGirl.build(:guest)
    user.should be_valid
  end
  
  it "should require password and passsword_confirmation match" do
    user = FactoryGirl.build(:user, :password_confirmation => "lalala")
    user.should_not be_valid
  end
  
  describe "login" do
    it "should reject too long login" do
      long_name = "a"*51
      FactoryGirl.build(:user, :login => long_name).should_not be_valid
    end
    
    it { should_not accept_values_for(:login, nil) }
  end
  
  describe "email" do
    it {should_not accept_values_for(:email, "invalid", nil, "a@b", "john@.com")}
  end
end
