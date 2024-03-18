ActiveAdmin.register SuperSubCategory do
    permit_params :name, :subcategory_id

    index do
      selectable_column
      id_column
      column :subcategory_id
      column :name
      actions
    end

    form do |f|
      f.inputs 'SuperSubCategory Details' do
        f.input :name
        f.input :subcategory, as: :select, collection: Subcategory.all.map { |c| [c.title, c.id] }, include_blank: false
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
