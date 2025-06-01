class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :character_type, null: false, default: 0
      t.string :race
      t.string :character_class # 'class' is reserved in Ruby
      t.integer :level
      t.json :stats # Flexible stats storage
      t.text :backstory
      t.integer :status, default: 0
      t.references :campaign, null: false, foreign_key: true
      t.timestamps
    end

    add_index :characters, [ :campaign_id, :character_type ]
    add_index :characters, :name
  end
end
