class ChangeDescriptionDataTypeInSyllabus < ActiveRecord::Migration[6.1]
  def change
    change_column :syllabuses, :title, :string
  end
end
