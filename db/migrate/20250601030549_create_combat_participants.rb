class CreateCombatParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :combat_participants do |t|
      t.references :combat, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.integer :initiative
      t.integer :current_hp
      t.integer :max_hp
      t.timestamps
    end

    add_index :combat_participants, [ :combat_id, :character_id ], unique: true
    add_index :combat_participants, [ :combat_id, :initiative ]
  end
end
