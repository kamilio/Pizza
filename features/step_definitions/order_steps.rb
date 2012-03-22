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

When /^I log in$/ do
  user = FactoryGirl.create(:user)
  step "I am on login page"
  fill_in 'Login', :with => user.login
  fill_in 'Password', :with => user.password
  click_on "Login"
end

When /^I log out$/ do
end

When /^I go to home page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see error notice$/ do
  pending # express the regexp above with the code you wish you had
end

