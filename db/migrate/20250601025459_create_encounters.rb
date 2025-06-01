class CreateEncounters < ActiveRecord::Migration[8.0]
  def change
    create_table :encounters do |t|
      t.integer :encounter_type, null: false
      t.text :description
      t.integer :status, default: 0
      t.text :result
      t.references :session, null: true, foreign_key: true
      t.timestamps
    end

    add_index :encounters, [ :session_id, :encounter_type ]
  end
end
