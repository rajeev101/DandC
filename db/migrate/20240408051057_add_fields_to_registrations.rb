class AddFieldsToRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_column :registrations, :company_name, :string
    add_column :registrations, :college_name, :string
  end
end
