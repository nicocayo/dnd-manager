class CreateConditions < ActiveRecord::Migration[8.0]
  def change
    create_table :conditions do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.json :buffs # Positive effects
      t.json :debuffs # Negative effects
      t.timestamps
    end

    add_index :conditions, :name, unique: true
  end
end
