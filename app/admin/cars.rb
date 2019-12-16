ActiveAdmin.register Car do
  permit_params :model, :brand, :manufacture_year, :model_year, :transmission,
                 :gears, :doors, :color, :seats_option

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
    actions
  end
end
