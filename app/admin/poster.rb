ActiveAdmin.register Poster do
  permit_params do
    Poster.column_names
  end

  form do |f|
    f.inputs do
      f.inputs '公司' do
        f.input :company
      end
      f.input :title
      f.input :main_photo, as: :qi_niu_file
    end

    f.actions
  end


end