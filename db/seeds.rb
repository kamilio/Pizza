require "factory_girl"
FactoryGirl.find_definitions

p FactoryGirl.create(:admin)
p FactoryGirl.create(:registered)
p FactoryGirl.create(:stuff)

