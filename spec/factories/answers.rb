# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    sequence(:content) { |n| "Answer content ##{ n }" }
    correct false
    question
  end
end
