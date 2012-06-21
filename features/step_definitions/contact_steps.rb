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
  assert page.has_content?(content)
end

Then /^the following email should be sent:$/ do |table|
  expected = Mail.new Hash[table.raw]
  actual   = Mail::TestMailer.deliveries.last

  assert_equal expected, actual
end

Then /^no emails should have been sent$/ do
  assert_equal 0, Mail::TestMailer.deliveries.count
end
