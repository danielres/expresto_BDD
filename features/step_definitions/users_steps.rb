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

When /^I go to my user page$/ do
  within ".userbox" do
    find("a[@href^='/en/users/']").click
  end
end

Given /^I am not logged in$/ do
  visit(destroy_user_session_path)
end
