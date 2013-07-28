# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_sequence do
    parent_question_id 1
    child_question_id 1
  end
end
