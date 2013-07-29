class AddEventTextToRecords < ActiveRecord::Migration
  def change
  	add_column :records, :event_text, :text
  end
end
