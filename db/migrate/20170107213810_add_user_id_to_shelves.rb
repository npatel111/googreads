class AddUserIdToShelves < ActiveRecord::Migration[5.0]
  def change
    add_column :shelves, :user_id, :integer
  end
end
