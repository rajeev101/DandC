ActiveAdmin.register Topic do
  permit_params :title, :description, :super_sub_category_id

    index do
      selectable_column
      id_column
      column :title
      column :description
      column :super_sub_category_id
      actions
    end

    form do |f|
      f.inputs 'Topic Details' do
        f.input :title
        f.input :description
        f.input :super_sub_category, as: :select, collection: SuperSubCategory.all.map { |c| [c.name, c.id] }, include_blank: false
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
