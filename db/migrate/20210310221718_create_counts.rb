class CreateCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :counts do |t|
      t.integer :employee_count
      t.integer :manager_count

      t.timestamps
    end
  end
end
