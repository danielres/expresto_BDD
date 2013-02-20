
When /^I add my expression$/ do
  @my_expression  = FactoryGirl.build :expression, author: @logged_user

  find( "[rel='add-expression']" ).click

  fill_in "expression_body",         with:  @my_expression.body
  fill_in "expression_meaning",      with:  @my_expression.meaning
  fill_in "expression_source_info",  with:  @my_expression.source_info
  find(   "#expression_created_by_author_true" ).click
  find(   "[data-purpose='submit-expression']" ).click
end

Then /^I should see my expression with its details and a link to my public profile$/ do
  e       = @my_expression
  details = [ e.body, e.meaning, e.source_info ]
  details.each{ |detail| page.should have_content detail }
  page.should have_css "a", text: @my_expression.author.name
end

When /^I visit my public profile$/ do
  pending
end

Then /^I should see my expression listed$/ do
  pending
end

Given /^I am a not logged in$/ do
  pending
end

Then /^I should see a way to log in$/ do
  pending
end

When /^I attempt to ad an expression$/ do
  pending
end

Then /^I should be offered an obvious way to log in$/ do
  pending
end




  # save_and_open_page


############## old steps:

Given /^(\d+) (.*) expressions have been added$/ do |amount, language|
  amount.to_i.times do |n|
    FactoryGirl.create(:expression, :language => Language.find_by_code(language[0..1].downcase) )
  end
end

Then /^I should see a link list with (\d+) expressions in (.*)$/ do |amount, language|
  code = language.downcase[0..1]
  find('ul.expressions').should have_selector(
    "li.expression[lang='#{code}'] a[href^='/#{code}/expressions/']",
    :count => amount
  )
  all("li.expression").first['id'].scan(/\d/).join().to_i.should > all("li.expression").last['id'].scan(/\d/).join().to_i
end

When /^I click on the first recent expression$/ do
  find('ul.expressions').all('a')[0].click
end

Then /^I should see the expression page with details and (.*) as author$/ do |author|
  find('div.expression').should have_selector('.body')
  page.should have_selector('.meaning')
  find('div.expression .author').should have_content(author)
end

Given /^(\d+) (.*) expressions by (.*)$/ do |qty, language, user|
    l = Language.find_by_code(language.downcase[0..1]) || FactoryGirl.create(:language, :name => language.downcase.strip, :code => language.downcase[0..1])
    u = User.find_by_name(user) || FactoryGirl.create(:user, :name => user)
    qty.to_i.times do |n|
      FactoryGirl.create(:expression, :language => l, :author => u)
    end
end

When /^I click on author link within an expression added by (.*)$/ do |author|
  within ('.expression .author') do
    click_link(author.to_s)
  end
end

When /^I click on the link to add an expression$/ do
  click_link('Add an expression')
end

Then /^I should see the created expression page$/ do
  page.should have_content("Expression was successfully created.")
  page.should have_selector(".expression .body")
  page.should have_selector(".expression .author")
end

Then /^I should see the last created expression$/ do
  page.should have_selector("#expression_#{Expression.unscoped.find(:last).id}")
end

Then /^I should not see the first created expression$/ do
  page.should_not have_selector("#expression_#{Expression.unscoped.find(:first).id}")
end

Given /^an expression in (.*) by (.*) with body "(.*?)"$/ do |language,author,body|
  code = language[0..1].downcase
  author = User.find_by_name(author) || FactoryGirl.create(:user, :name => author)
  FactoryGirl.create(:expression, :body => body, :language => Language.find_by_code(code), :author => author)
end

Given /^an expression in ([a-zA-Z]*) with body "(.*?)"$/ do |language,body|
  code = language[0..1].downcase
  FactoryGirl.create(:expression, :body => body, :language => Language.find_by_code(code))
end

When /^I go to the last expression page$/ do
#   pending # express the regexp above with the code you wish you had
  e=Expression.find(:last)
  visit expression_path(e, :locale => :en)
end
