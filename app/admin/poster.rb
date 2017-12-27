ActiveAdmin.register Poster do
  permit_params do
    Poster.column_names
  end

  form do |f|
    f.inputs do
      f.input :companys
      f.input :title
      f.input :main_photo, as: :qi_niu_file
    end

    f.actions
  end


end