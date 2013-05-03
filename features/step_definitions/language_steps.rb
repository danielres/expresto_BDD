Given /^language English is available$/ do
  languages = %w( Engllish )
  languages.each do |l|
      Language.create code: l[0..1].downcase, name: l.strip
  end
end


Given /^available languages?: (.*)$/ do |languages|
  languages = languages.split(', ')
  languages.each do |l|
      Language.create code: l[0..1].downcase, name: l.strip
  end
end

Then /^I should see language menu with (.*)$/ do |arg1|
  language_codes = arg1.split(", ").map{|s|s.downcase[0..1]}
  language_codes.each do |code|
    find("div.menu.languages ul").should have_content code
  end
end

When /^I set language to (.*)$/ do |language|
  click_link language.downcase[0..1]
end

