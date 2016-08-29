class ChangePhoneTypeEmployee < ActiveRecord::Migration[5.0]
  def change
  	change_column :employees, :phone, :string
  end
end
