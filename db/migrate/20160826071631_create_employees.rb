class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :employee_id

      t.timestamps
    end
  end
end
