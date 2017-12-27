ActiveAdmin.register Offer do
  permit_params do
    Offer.column_names
  end

  form do |f|
    f.inputs do
      f.inputs '公司' do
        f.input :company
      end
      f.input :title
      f.input :description
      f.input :age
      f.input :Salary

    end

    f.actions
  end
end
