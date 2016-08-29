class AddSalaryToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :salary, :integer
  end
end
