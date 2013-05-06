Then /^I should see the page of (.*)$/ do |name|
  find("div.user h2.name").should have_content(name)
end

Then /^I should see (\d+) (.*) expressions added by (.*)/ do |qty, language, author|
  code = language.downcase[0..1]
  find('div.user').should have_selector("ul.expressions>li.expression[lang='#{code}']", :count => qty)
end

When /^I visit (.*)'s page$/ do |name|
  visit user_path(User.find_by_name(name), :locale => Language.first.code)
end

Given /^I am logged in as '(.*)'$/ do |name|
  email = "#{name.downcase}@test.com"
  password = "please"
  u = FactoryGirl.create(:user, :name => name, :email => email, :password => password)
  visit new_user_session_path
  fill_in("Email", :with => email )
  fill_in("Password", :with => password )
  click_button("Sign in")
  find('.userbox').should have_content(name)
end

Given /^I am logged in as an administrator$/ do
  name = 'adminuser'
  email = "#{name.downcase}@test.com"
  password = "please"
  u = FactoryGirl.create(:user, :name => name, :email => email, :password => password, :role => 'admin' )
  visit new_user_session_path
  click_link 'en'
  fill_in("Email", :with => email )
  fill_in("user_password", :with => password )
  click_button("Sign in")
  find('.userbox').should have_content(name)
end

When /^I visit my user page$/ do
  within ".userbox" do
    find("a[@href^='/en/users/']").click
  end
end
