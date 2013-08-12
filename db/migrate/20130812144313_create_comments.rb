class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :notes
      t.text :questions
      t.integer :user_id
      t.integer :interview_id

      t.timestamps
    end
  end
end
