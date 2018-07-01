FactoryBot.define do
  factory :point_of_interest do
    sequence(:name) { |n| "Point-#{n}" }
    x 1
    y 1

    factory :snack_bar_point do
      name 'Snack bar'
      x 27
      y 12
    end

    factory :gas_station_point do
      name 'Gas station'
      x 31
      y 18
    end

    factory :jewelry_point do
      name 'Jewelry'
      x 15
      y 12
    end

    factory :floriculture_point do
      name 'Floriculture'
      x 19
      y 21
    end

    factory :pub_point do
      name 'Pub'
      x 12
      y 8
    end

    factory :supermarket_point do
      name 'Supermarket'
      x 23
      y 6
    end

    factory :steakhouse_point do
      name 'Stackhouse'
      x 28
      y 2
    end
  end
end
