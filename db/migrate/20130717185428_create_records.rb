class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :relationship_id
      t.text :event

      t.timestamps
    end
  end
end
