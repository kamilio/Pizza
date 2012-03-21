require 'spec_helper'

describe Item do
  it "should create an instance" do
    item = FactoryGirl.create(:item)
    item.should be_valid
  end
    
  it "should be invalid without name" do
    item = FactoryGirl.build(:item, :name => nil)
    item.should_not be_valid
  end
  
  it "should be invalid without price" do
    item = FactoryGirl.build(:item, :price => nil)
    item.should_not be_valid
  end
  
  it "should be invalid with wrong price" do
    item = FactoryGirl.build(:item, :price => "lala")
    item.should_not be_valid 
  end
end