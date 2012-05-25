Given /^languages French, English are available$/ do
  Language.create code: 'en', name: 'English'
  Language.create code: 'fr', name: 'French'
end

Then /^I should see language menu with (.*)$/ do |arg1|
  language_codes = arg1.split(", ").map{|s|s.downcase[0..1]}
  language_codes.each do |code|
    find("div.menu.languages ul").should have_content code
  end
end
