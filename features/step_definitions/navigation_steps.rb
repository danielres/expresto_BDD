When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then 'show me the page' do
  save_and_open_page
end

