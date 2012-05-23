# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
    body "MyText"
    meaning "MyText"
    author, :factory => :user
    language
  end
end
