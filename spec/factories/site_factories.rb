FactoryGirl.define do
  factory :site do
    sequence(:name) { |i| "Site ##{i}" }
    association :logo, :factory => :site_logo
  end
end
