When /^I go to the homepage$/ do
  visit '/en'
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
  should have_selector("a.#{text.downcase}")
end

When /^I should not see a "(.*?)" link$/ do |cssclass|
  page.should_not have_selector("a.#{cssclass.downcase}")
end

When /^I click on the "(.*?)" link$/ do |class_name|
  find("a.#{class_name}").click
end

When /^I click on "(.*)"$/ do |text|
  click_on text
end

Then /^I should see the "(.*)" page$/ do |page_name|
  controller, action = page_name.split(' ')
  find('body')['class'].should == [controller,action].join('-')
  # note for self:
  # or maybe use this: current_url.should == foo_url(:param => 'value')
end

Then /^I should see (.*) (?:paginator|paginators)$/ do |qty|
  page.should have_selector('div.pagination>ul', :count => qty)
end
