class AddReferenceToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :company, foreign_key: true
  end
end
