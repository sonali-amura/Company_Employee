class AddRefToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :employee, foreign_key: true
  end
end
