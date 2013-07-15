class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.string :title
      t.text :decription

      t.timestamps
    end
  end
end
