class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :streat
      t.string :city
      t.integer :pincode

      t.timestamps
    end
  end
end
