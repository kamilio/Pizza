require 'spec_helper'

describe Order do  
  before do
    @order = FactoryGirl.create(:order)
    @item = FactoryGirl.create(:item)
    @x = 5 # variable
  end
  subject { @order }
  it "should add item to order" do
    @x.times {@order.add_item @item}
    @order.items.find_by_id(@item.id).items_count.first.count.should == @x
  end 
  it "should remove item from order" do
    @x.times {@order.add_item @item}
    @x.times {@order.remove_item @item}
    @order.items.find(@item.id).items_count.first.count.should == 0
  end
  it "should change status of order" do
    @order.change_status :accepted
    @order.status.should == :accepted
  end
  
  it "should return the count of items in order" do
    item = FactoryGirl.create(:item)
    x = 5
    x.times do
      @order.add_item item
    end
    @order.get_count_for_item(item).should == 5
  end
  it "should count the sum of all items in order" do
    item =FactoryGirl.create(:item) 
    x = 5
    x.times { @order.add_item(item) } 
    @order.sum.should == x*item.price 
  end
  
  it "should not allow negative items count" do
    @order.add_item @item
    @x.times { @order.remove_item @item }
    @order.get_count_for_item(@item).should == 0
  end
end
