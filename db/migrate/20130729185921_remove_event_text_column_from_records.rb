class RemoveEventTextColumnFromRecords < ActiveRecord::Migration
  def change
  	remove_column :records, :event_text
  end
end
