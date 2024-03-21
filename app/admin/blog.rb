ActiveAdmin.register Blog do
  permit_params :name, :image, :description
  
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :image do |ad|
      if ad.image.attached?
        image_tag(url_for(ad.image), size: '100x50')
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Blogs Details' do
      f.input :name
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :image do |ad|
        if ad.image.attached?
          image_tag(url_for(ad.image), size: '100x50')
        end
      end
    end
  end
end