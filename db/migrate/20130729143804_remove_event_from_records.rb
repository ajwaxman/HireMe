class RemoveEventFromRecords < ActiveRecord::Migration
  def change
  	remove_column :records, :event  
  end
end
