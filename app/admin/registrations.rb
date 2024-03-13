ActiveAdmin.register Registration do
  permit_params :your_name, :email, :phone_number, :course_of_interest, :message

  index do
    selectable_column
    id_column
    column :your_name
    column :email
    column :phone_number
    column :course_of_interest
    actions
  end

  filter :your_name
  filter :email
  filter :course_of_interest

  form do |f|
    f.inputs 'Registration Details' do
      f.input :your_name
      f.input :email
      f.input :phone_number
      f.input :course_of_interest, as: :select, collection: ["Cyber Security", "Game Development", "Ethical Hacking", "Python", "HTML5", "CSS3", "Bootstrap", "Javascript", "JQuery", "Ajax", "Angular JS", "C Programming", "Advance C++", "PHP", "Core Java", "Advance Java", "Corporate Java", "Android", "IOS", "Big Data", "Hadoop"], prompt: "Please Select Course"
      f.input :message
    end
    f.actions
  end
end
