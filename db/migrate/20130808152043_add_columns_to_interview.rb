class AddColumnsToInterview < ActiveRecord::Migration
  def change
    add_column :interviews, :job_id, :integer
    add_column :interviews, :user_id, :integer
  end
end
