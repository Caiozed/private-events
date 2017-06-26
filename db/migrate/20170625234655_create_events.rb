class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.integer :creator_id

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
