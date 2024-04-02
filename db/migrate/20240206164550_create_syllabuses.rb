class CreateSyllabuses < ActiveRecord::Migration[6.1]
  def change
    create_table :syllabuses do |t|
      t.references :course, null: false, foreign_key: true
      t.string :course_name
      t.text :description
      t.string :title


      t.timestamps
    end
  end
end