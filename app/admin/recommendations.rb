ActiveAdmin.register Recommendation do
  permit_params :full_name, :description

  index do
    selectable_column
    id_column
    column :full_name
    column :description
    actions
  end

  form do |f|
    f.inputs 'FAQ Details' do
      f.input :full_name
      f.input :description, as: :text
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :description
    end
  end
  
end
