class RemoveColumnToAddress < ActiveRecord::Migration[5.0]
  def change
  	remove_column :addresses,:company_id
  	remove_column :employees,:employee_id
  end
end
