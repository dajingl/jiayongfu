ActiveAdmin.register Company do
  permit_params do
    Company.column_names
  end

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs '企业' do
      f.input :name
      f.input :main
      f.input :logo, as: :qi_niu_file
      f.input :qr_code, as: :qi_niu_file
      f.input :address
    end

    f.inputs '企业文化' do
      f.input :introduction
      f.input :culture, input_html: {class: 'rich-editor box',data: {'image-upload-token': QiniuToken.token_for_simditor }}
    end

    f.actions
  end


end
