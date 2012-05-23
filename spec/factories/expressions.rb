# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
    body "MyText"
    meaning "MyText"
    author
    language
  end
end
