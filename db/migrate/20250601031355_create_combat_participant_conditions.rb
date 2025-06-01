class CreateCombatParticipantConditions < ActiveRecord::Migration[8.0]
  def change
    def change
      create_table :combat_participant_conditions do |t|
        t.references :combat_participant, null: false, foreign_key: true
        t.references :condition, null: false, foreign_key: true
        t.timestamps
      end

      add_index :combat_participant_conditions,
                [ :combat_participant_id, :condition_id ],
                unique: true,
                name: 'index_combat_conditions_unique'
    end
  end
end
