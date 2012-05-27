Then /^I should see the page of (.*)$/ do |name|
  find("div.user h2.name").should have_content(name)
end

Then /^I should see (\d+) (.*) expressions added by (.*)/ do |qty, language, author|
  code = language.downcase[0..1]
  find('div.user').should have_xpath("ul[@class='expressions']/li[@class='expression' and @lang='#{code}']", :count => qty)
end

When /^I go to (.*)'s page$/ do |name|
  visit user_path(User.find_by_name(name), :locale => Language.first.code)
end
