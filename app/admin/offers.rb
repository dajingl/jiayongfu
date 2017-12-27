ActiveAdmin.register Offer do
  permit_params do
    Offer.column_names
  end

  form do |f|
    f.inputs do
      f.input :companys
      f.input :title
      f.input :description
      f.input :age
      f.input :Salary

    end

    f.actions
  end
end
