Given /^I am logged in$/ do
  user = FactoryGirl.create :user
  visit new_user_session_path
  fill_in "user_email"   , with: user.email
  fill_in "user_password", with: user.password
  find( "[data-purpose='sign-in']" ).click

  find( "[data-purpose='userbox']" ).should have_content user.name
end
