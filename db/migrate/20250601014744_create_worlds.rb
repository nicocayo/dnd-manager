class CreateWorlds < ActiveRecord::Migration[8.0]
  def change
    create_table :worlds do |t|
      t.string :name, null: false
      t.text :description
      t.references :campaign, null: false, foreign_key: true
      t.timestamps
    end

    add_index :worlds, [ :campaign_id, :name ]
  end
end
