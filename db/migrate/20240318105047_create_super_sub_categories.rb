class CreateSuperSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :super_sub_categories do |t|
      t.string :name
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
