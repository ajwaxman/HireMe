class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :student_id
      t.integer :job_id
      t.integer :company_id
      t.string :status

      t.timestamps
    end
  end
end
