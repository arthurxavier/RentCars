FactoryBot.define do
  factory :rent do
    status {'reserved'}
    price {300.00}
    rent_date {Date.new(2019, 5, 12)}
    return_date {Date.new(2019, 5, 20)}
    client
    car
  end
end

