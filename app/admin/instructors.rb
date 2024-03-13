ActiveAdmin.register Instructor do
  permit_params :full_name, :bio, :image

  index do
    selectable_column
    id_column
    column :full_name
    column :bio
    column :image do |ad|
      if ad.image.attached?
        image_tag(url_for(ad.image), size: '50x50', style: 'border-radius: 50%;')
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Instructor Details' do
      f.input :full_name
      f.input :bio, as: :text
      f.input :image, as: :file
    end
    f.actions
  end
end