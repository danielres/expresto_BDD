When /^I go to the homepage$/ do
  visit root_path
  save_and_open_page
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end
