ActiveAdmin.register Car do
  permit_params :model, :brand, :manufacture_year, :model_year, :transmission,
                 :gears, :doors, :color, :seats_option, :price

  index do
    id_column
    column "Model" do |car|
      div :class => "car-model" do
        "#{car.brand} #{car.model}"
      end
    end
    column "Model Year" do |car|
      div :class => "year-model" do
        "#{car.manufacture_year} #{car.model_year}"
      end
    end
    column "Gear Box", :transmission
    column :gears
    column :doors
    column :color
    column "Seats", :seats_option
    column :price do |car|
      div :class => "price" do
        "R$ #{car.price}"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :brand
      f.input :model
      f.input :manufacture_year
      f.input :model_year
      f.input :transmission, :as => :select, collection: Hash[Car.transmission.options]
      f.input :gears
      f.input :doors
      f.input :color
      f.input :seats_option, :as => :select, collection: Hash[Car.seats_option.options]
      f.input :price
    end
    f.actions
  end
end
