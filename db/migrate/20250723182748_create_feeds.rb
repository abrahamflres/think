class CreateFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :feeds do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
