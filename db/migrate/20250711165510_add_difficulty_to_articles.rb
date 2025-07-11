class AddDifficultyToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :difficulty, :string
  end
end
