ActiveAdmin.register Syllabus do
 
  permit_params :course_id, :description, :title

  form do |f|
    f.inputs do
      f.input :description, as: :quill_editor
      f.input :title
      f.input :course, as: :select, collection: Course.all.map { |c| [c.course_name, c.id] }, include_blank: false
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :course
    column :title
    column :description
    actions
  end
end

