class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.references :super_sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
