Given /^(\d+) (.*) expressions have been added$/ do |amount, language|
  amount.to_i.times do |n|
    FactoryGirl.create(:expression, :language => Language.find_by_code(language[0..1].downcase) )
  end
end

Then /^I should see (\d+) (.*) expressions$/ do |amount, language|
  find('.expressions').should have_selector('.expression', :count => amount)
  find('.expressions .expression .language').should have_content(language.downcase[0..1])
end


