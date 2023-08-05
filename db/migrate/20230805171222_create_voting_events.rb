class CreateVotingEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :voting_events do |t|
      t.string :event_Name
      t.text :event_Description
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
