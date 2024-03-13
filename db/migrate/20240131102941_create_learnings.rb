class CreateLearnings < ActiveRecord::Migration[6.1]
  def change
    create_table :learnings do |t|

      t.timestamps
    end
  end
end
