FactoryBot.define do
  factory :car do
    model {'Hyundai'}
    brand {'HB20 Rspec'}
    manufacture_year {2018}
    model_year {2017}
    transmission {:manual}
    gears {5}
    doors {4}
    color {'#ff0000'}
    seats_option {:leather}
    price {100.00}
  end
end
