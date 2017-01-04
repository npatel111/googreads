class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :author_id
      t.integer :genre_id


      t.timestamps
    end
  end
end
