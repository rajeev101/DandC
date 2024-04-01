class AddDescriptionToSyllabus < ActiveRecord::Migration[6.1]
  def change
    add_column :syllabuses, :description, :text
  end
end
