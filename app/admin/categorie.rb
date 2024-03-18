ActiveAdmin.register Category do
  permit_params :title, :image
  
  index do
    selectable_column
    id_column
    column :title
    column :image do |ad|
      if ad.image.attached?
        image_tag(url_for(ad.image), size: '100x50')
      end
    end
    column :image_url do |ad|
      if ad.image.attached?
        link_to(url_for(ad.image))
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Course Details' do
      f.input :title
      f.input :image, as: :file
    end
    f.actions
  end
end