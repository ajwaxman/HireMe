class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :company_id

      t.timestamps
    end
  end
end
