class CreateEcounterParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :encounter_participants do |t|
      t.references :encounter, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.timestamps
    end

    add_index :encounter_participants, [ :encounter_id, :character_id ], unique: true
  end
end
