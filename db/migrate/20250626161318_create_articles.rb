class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :status
      t.integer :likes_count
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
