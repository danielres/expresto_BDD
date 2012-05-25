Given /^(\d+) english expressions have been added$/ do |arg1|
  arg1.to_i.times do |n|
    FactoryGirl.create(:expression)
  end
end

