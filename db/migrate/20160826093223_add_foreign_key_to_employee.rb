class AddForeignKeyToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :company_id, foreign_key: true
  end
end
