class RemoveDateTimeFromRelationship < ActiveRecord::Migration
  def change
		remove_column :relationships, :date_time  
  end
end