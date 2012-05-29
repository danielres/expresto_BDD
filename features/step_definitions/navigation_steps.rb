When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see "(.*?)"$/ do |arg1|
  page.should_not have_content(arg1)
end

Then 'show me the page' do
  save_and_open_page
end

Then /^I should see a "(.*)" link to the page "(.*)"$/ do |text, page_name|
  controller  = page_name.split(' ').first
  action      = page_name.split(' ').last
  should have_selector(".#{text.downcase} a")
end
