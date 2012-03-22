Given /^the following items exist$/ do |table|
  table.hashes.each do |item|
    Item.create item
  end
end

Given /^I am a logged user$/ do
  step "I log in"
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^"]*)"$/ do |button|
  click_on(button)
  debugger
end

