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
end

Given /^I log in$/ do
  step "I am on login page"
  step "I am the registered user"
  step "I login with valid credentials"
  step "I should be on the home page"
  step "I should see \"Login successful!\""
end

