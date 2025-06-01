class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.date :date, null: false
      t.string :title, null: false
      t.text :summary
      t.integer :duration # in minutes
      t.references :campaign, null: false, foreign_key: true
      t.timestamps
    end

    add_index :sessions, [ :campaign_id, :date ]
  end
end
