FactoryBot.define do
  factory :car do
    model {'Hyundai'}
    brand {'HB20 Rspec'}
    manufacture_year {2018}
    model_year {2017}
    transmission {'Manual'}
    gears {5}
    doors {4}
    color {'#ff0000'}
    seats_option {'Couro'}
    price {100.00}
  end
end
