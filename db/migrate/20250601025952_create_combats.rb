class CreateCombats < ActiveRecord::Migration[8.0]
  def change
    create_table :combats do |t|
      t.string :name, null: false
      t.json :initiative_order # Array of participant IDs in turn order
      t.integer :current_round, default: 1
      t.integer :duration # in rounds
      t.references :encounter, null: false, foreign_key: true
      t.timestamps
    end
  end
end
