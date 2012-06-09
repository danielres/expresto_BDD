# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
    language
    author
    sequence(:body){|n|"Expression #{n} body"}
    sequence(:meaning){|n|"Expression #{n} meaning"}
    source_type Expression::SOURCE_TYPES.first
  end
end
