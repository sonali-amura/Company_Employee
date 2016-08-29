class AddColumnsToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :imageable_id, :integer
    add_column :addresses, :imageable_type, :string
  end
end
