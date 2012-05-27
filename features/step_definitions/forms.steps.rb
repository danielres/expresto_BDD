When /^I fill in "(.*?)" with "(.*?)"$/ do |field, content|
  fill_in field, :with => content
end

When /^I click the submit button$/ do
  find("input[type=submit]").click
end
