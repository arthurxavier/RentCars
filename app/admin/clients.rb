ActiveAdmin.register Client do
  permit_params :name, :cpf, :cnh, :birth_date

  index do
    id_column
    column :name
    column 'CPF', :cpf
    column 'CNH', :cnh
    column :birth_date
    actions
  end

  filter :cpf
  filter :cnh

  form do |f|
    f.inputs do
      f.input :name
      f.input :cpf
      f.input :cnh
      f.input :birth_date, end_year: (Date.today.year-100), start_year: (Date.today.year-18)
    end
    f.actions
  end
end
