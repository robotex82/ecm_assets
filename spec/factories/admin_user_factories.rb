FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |i| "example#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end

