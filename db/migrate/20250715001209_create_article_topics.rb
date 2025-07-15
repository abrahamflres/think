class CreateArticleTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :article_topics do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
