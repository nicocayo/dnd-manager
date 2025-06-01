class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :location_type, null: false
      t.text :description
      t.integer :population
      t.references :world, null: false, foreign_key: true
      t.references :parent_location, null: true, foreign_key: { to_table: :locations }
      t.timestamps
    end

    add_index :locations, [ :world_id, :location_type ]
    add_index :locations, :parent_location_id
  end
end
