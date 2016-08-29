class RemoveColumnFromAddress < ActiveRecord::Migration[5.0]
  def change
  	remove_column :addresses,:employee_id
  end
end
