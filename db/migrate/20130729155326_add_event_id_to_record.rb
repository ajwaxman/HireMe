class AddEventIdToRecord < ActiveRecord::Migration
  def change
  	add_column :records, :event_id, :integer
  end
end
