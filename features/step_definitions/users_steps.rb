Then /^I should see the page of (.*)$/ do |name|
  find("div.user h2.name").should have_content(name)
end

Then /^I should see (\d+) (.*) expressions added by (.*)/ do |qty, language, author|
  code = language.downcase[0..1]
  find('div.user ul.expressions').should have_xpath("li[@class='expression' and @lang='#{code}']", :count => qty)
end
