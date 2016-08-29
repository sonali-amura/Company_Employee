class AddIndexOnAddress < ActiveRecord::Migration[5.0]
  def change
  	 add_index :addresses, :imageable_id
  end
end
