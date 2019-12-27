ActiveAdmin.register Rent do
  permit_params :status, :price, :rent_date, :return_date,
                :client_id, :car_id
  index do
    id_column
    column :status
    column :price
    column :rent_date
    column :return_date
    column :client do |rent|
      div :class => "client" do
        rent.client.name
      end
    end
    column :car do |rent|
      div :class => "car" do
        rent.car.name
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :client_id, :as => :select, :collection => Hash[Client.all.map{|c| [c.name,c.id]}]
      f.input :car_id, :as => :select, :collection => Hash[Car.all.map{|c| [c.name,c.id]}]
      f.input :status, :as => :select, collection: Hash[Rent.status.options]
      f.input :rent_date, as: :datepicker,
              datepicker_options: {
                  min_date:  Date.today,
                  max_date: "+30D"
              }
      f.input :return_date, as: :datepicker,
              datepicker_options: {
                  min_date:  Date.today,
                  max_date: "+30D"
              }
    end
    f.actions
  end
end
