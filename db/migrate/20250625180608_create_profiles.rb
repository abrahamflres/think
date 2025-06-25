class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :streak
      t.text :bio
      t.string :firstname
      t.string :lastname
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
