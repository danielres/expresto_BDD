Given /^(\d+) (.*) expressions have been added$/ do |amount, language|
  amount.to_i.times do |n|
    FactoryGirl.create(:expression, :language => Language.find_by_code(language[0..1].downcase) )
  end
end

Then /^I should see a link list with (\d+) expressions in (.*)$/ do |amount, language|
  code = language.downcase[0..1]
  find('ul.expressions').should have_xpath(
    "li[@class='expression' and @lang='#{code}']//a[contains(@href,'/#{code}/expressions/')]",
    :count => amount
  )
end

When /^I click on the first recent expression$/ do
  find('ul.expressions').all('a')[0].click
end

Then /^I should see the expression page with details$/ do
  find('div.expression').should have_selector('.body')
  find('div.expression').should have_selector('.meaning')
  find('div.expression .author').should have_content('Test User')
end

