ActiveAdmin.register Subcategory do
  permit_params :title, :category_id, :image

  index do
    selectable_column
    id_column
    column :categorie_id
    column :title
    column :image do |ad|
      if ad.image.attached?
        image_tag(url_for(ad.image), size: '100x50')
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Subcategory Details' do
      f.input :title
      f.input :image, as: :file
      f.input :category, as: :select, collection: Category.all.map { |c| [c.title, c.id] }, include_blank: false
    end
    f.actions
  end


  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end
end
