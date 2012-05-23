# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
    body "MyText"
    meaning "MyText"
    author_id 1
    language_id 1
  end
end
