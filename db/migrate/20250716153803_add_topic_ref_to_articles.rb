class AddTopicRefToArticles < ActiveRecord::Migration[8.0]
  def change
    add_reference :articles, :topic, null: true, foreign_key: true
  end
end
