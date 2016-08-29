class AddDesignationToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :designation, :string
  end
end
