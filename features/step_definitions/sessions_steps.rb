
Given /^I am logged in$/ do
  visit new_user_session_path
  fill_in "user_email"   , with: logged_user.email
  fill_in "user_password", with: logged_user.password

  click the 'sign-in'
  find( the 'userbox' ).should have_content logged_user.name

end

Given /^I am not logged in$/ do
  visit(destroy_user_session_path)
  within the 'userbox' do
    page.should_not have_css ".sign_out a"
  end
end

Then /^I should see a way to log in$/ do
  href = new_user_session_path locale: 'en'
  page.should have_css ".sign_in a[href='#{href}']"
end

Then /^I should be offered an obvious way to authenticate$/ do
  within the 'main-content' do
    page.should have_css "form#new_user_session"
    page.should have_css "form#new_user"
  end
end