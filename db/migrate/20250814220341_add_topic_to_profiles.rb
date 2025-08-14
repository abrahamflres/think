class AddTopicToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_reference :profiles, :topic, null: true, foreign_key: true
  end
end
