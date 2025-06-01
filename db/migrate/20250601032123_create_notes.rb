class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content
      t.integer :coming_from, null: false
      t.bigint :origin_id, null: false
      t.timestamps
    end

    add_index :notes, [ :coming_from, :origin_id ]
    add_index :notes, :title
  end
end
