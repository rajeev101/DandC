class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.string :your_name
      t.string :email
      t.string :phone_number
      t.string :course_of_interest
      t.text :message

      t.timestamps
    end
  end
end
