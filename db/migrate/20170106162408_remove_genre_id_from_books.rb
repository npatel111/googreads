class RemoveGenreIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :genre_id, :integer
  end
end
