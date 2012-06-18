Given /^I am on the contact page$/ do
  visit "/messages/new"
end

When /^I complete the contact form with the following values:$/ do |table|
  Hash[table.raw].each do |field, value|
    fill_in field, :with => value
  end

  click_button "Send message"
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end
