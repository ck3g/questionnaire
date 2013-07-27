# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{ n }@example.com" }
    password 'secret'

    factory :admin do
      sequence(:email) { |n| "admin-#{ n }@example.com" }
      roles [:admin]
    end
  end
end
