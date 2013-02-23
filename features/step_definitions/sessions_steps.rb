
Given /^I am logged in$/ do
  visit new_user_session_path
  fill_in "user_email"   , with: logged_user.email
  fill_in "user_password", with: logged_user.password
  find( "[data-purpose='sign-in']" ).click

  find( "[data-purpose='userbox']" ).should have_content logged_user.name
end
