Then(/^I should see an suggestion to login to comment$/) do
  page.should have_text I18n.t('expressions.show.sign_in_to_comment')
end
