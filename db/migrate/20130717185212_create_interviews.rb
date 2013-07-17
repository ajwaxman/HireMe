class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :relationship_id

      t.timestamps
    end
  end
end
