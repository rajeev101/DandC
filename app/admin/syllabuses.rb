ActiveAdmin.register Syllabus do
  actions :index, :show, :create, :edit, :new, :destroy
  permit_params :course_name, :duration, :database, :course_id, :title
  # filter :course, as: :select, collection: Course.all.map { |c| [c.course_name, c.id] }, prompt: 'Select Course'
  filter :title

  form do |f|
    f.inputs do
      f.input :course_id, as: :select, collection: Course.all.map { |c| [c.course_name, c.id] }, prompt: 'Select Course'
      f.input :database
      f.input :title
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    # column :course_name
    column :course do |syllabus|
      syllabus.course.course_name
    end
    column :database  
    # column :title
    # column :titile, as: :select
    column :title do |syllabus|
      link_to syllabus.title, admin_syllabus_path(syllabus)
    end

    actions
  end

  show do
    attributes_table do
      row :course_name do
        resource.course.course_name if resource.course
      end
      row :title
      row :database, href: admin_syllabus_path(resource)
    end
  end


  controller do
    def scoped_collection
      end_of_association_chain.includes(:course)
    end

    def create
      super do |format|
        redirect_to collection_path and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_path and return if resource.valid?
      end
    end
  end
end
