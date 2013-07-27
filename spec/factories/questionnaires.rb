# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :questionnaire do
    sequence(:name) { |n| "Questionnaire ##{ n }" }
  end
end
