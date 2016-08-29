class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :employees,:company_id
  	remove_column :employees,:company_id_id
  end
end
