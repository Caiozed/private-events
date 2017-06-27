class AddEventDescriptionToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_description, :text
  end
end
