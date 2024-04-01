ActiveAdmin.register Syllabus do
  actions :index, :show, :create, :edit, :new, :destroy
  permit_params :course_id, :description, :title  # Corrected permit_params

  form do |f|
    f.inputs do
      f.input :description
      f.input :title
      f.input :course_id, as: :select, collection: Course.all.map { |c| [c.course_name, c.id] }, include_blank: false
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :course_id
    column :title
    column :description
    actions
  end
end
