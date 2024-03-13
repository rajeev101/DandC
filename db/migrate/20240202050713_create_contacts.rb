class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.text :address
      t.text :open_time
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
