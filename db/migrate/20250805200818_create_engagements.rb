class CreateEngagements < ActiveRecord::Migration[8.0]
  def change
    create_table :engagements do |t|
      t.string :activity
      t.date :activity_date
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
