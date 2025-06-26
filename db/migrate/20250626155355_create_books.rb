class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :published_at
      t.string :genre
      t.string :link

      t.timestamps
    end
  end
end
