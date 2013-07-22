class ChangeDateTimeToDateAndTime < ActiveRecord::Migration
	def change
		remove_column :interviews, :start_time
		remove_column :interviews, :end_time
		add_column :interviews, :date, :date
		add_column :interviews, :start_time, :time
		add_column :interviews, :end_time, :time	
	end
end
