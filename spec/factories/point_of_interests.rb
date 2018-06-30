FactoryBot.define do
  factory :point_of_interest do
    sequence(:name) { |n| "Point-#{n}" }
    x 1
    y 1
  end
end
