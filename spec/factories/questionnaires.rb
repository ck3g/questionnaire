# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :questionnaire do
    sequence(:name) { |n| "Questionnaire ##{ n }" }
    published_at { Time.current }

    trait :unpublished do
      published_at nil
    end

    factory :unpublished_questionnaire, traits: [:unpublished]
  end
end
