class AddDateTimeToRelationships < ActiveRecord::Migration
  def change
  	add_column :relationships, :date_time, :datetime
  end
end
