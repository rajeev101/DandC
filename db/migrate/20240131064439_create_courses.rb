class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:courses)
      create_table :courses do |t|
        t.string :course_name
        t.text :description
        t.string :price
        t.string :discounted_price
        t.string :live_classes
        t.string :quizzes
        t.string :projects
        t.string :doubt_support
        t.string :interview_questions_covered
        t.string :lifetime_access
        t.string :image_url

        t.timestamps
      end
    end
  end
end
