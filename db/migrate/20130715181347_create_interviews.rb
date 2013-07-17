class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :company_id
      t.string :status

      t.timestamps
    end
  end
end
