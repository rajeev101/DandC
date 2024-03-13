ActiveAdmin.register Course do
  permit_params :course_name, :description, :price, :discounted_price, :live_classes, :quizzes, :projects, :doubt_support, :interview_questions_covered, :lifetime_access, :image_url, :image
  
  index do
    selectable_column
    id_column
    column :course_name
    column :description
    column :live_classes
    column :quizzes
    column :projects
    column :doubt_support
    column "Interview Ques", :interview_questions_covered
    column "life", :lifetime_access
    column :price
    column "dis_price",:discounted_price
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
  show do
    attributes_table do
      row :course_name
      row :description
      row :price
      row :discounted_price
      row :live_classes
      row :quizzes
      row :projects
      row :doubt_support
      row "Interview Ques", :interview_questions_covered
      row :lifetime_access
      row :image do |ad|
        if ad.image.attached?
          image_tag(url_for(ad.image), size: '100x50')
        end
      end
      row :image_url do |ad|
        if ad.image.attached?
          link_to(url_for(ad.image))
        end
      end
    end
    # panel 'Syllabuses' do
    #   table_for course.syllabuses do
    #     row :duration
    #     row :database
    #   end
    # end
  end


  form do |f|
    f.inputs 'Course Details' do
      f.input :course_name
      f.input :description
      f.input :price
      f.input :discounted_price
      f.input :live_classes
      f.input :quizzes
      f.input :projects
      f.input :doubt_support
      f.input :interview_questions_covered, label:"interview Ques"
      f.input :lifetime_access
      f.input :image, as: :file
    end
    f.actions
  end

  filter :course_name
  filter :description
  filter :price
  filter :discounted_price
end