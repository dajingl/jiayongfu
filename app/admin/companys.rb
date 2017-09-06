ActiveAdmin.register Company do
  permit_params do
    Company.column_names
  end

  form do |f|
    f.inputs '企业' do
      f.input :name
      f.input :logo, as: :qi_niu_file
      f.input :qr_code, as: :qi_niu_file
      f.input :address
    end

    f.inputs '企业文化' do
      f.input :Introduction
      f.input :culture
      f.input :main
    end

    f.actions
  end


end
