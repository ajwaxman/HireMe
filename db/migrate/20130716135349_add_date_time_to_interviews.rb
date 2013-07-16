class AddDateTimeToInterviews < ActiveRecord::Migration
  def change
  	add_column :interviews, :date_time, :datetime
  end
end
