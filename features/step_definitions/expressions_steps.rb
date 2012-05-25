Given /^(\d+) (.*) expressions have been added$/ do |amount, language|
  amount.to_i.times do |n|
    FactoryGirl.create(:expression, :language => Language.find_by_code(language[0..1].downcase) )
  end
end

Then /^I should see (\d+) (.*) expressions$/ do |amount, language|
  find('.expressions').should have_xpath(
    "*[@class='expression' and @lang='#{language.downcase[0..1]}']",
    :count => amount
  )
end


