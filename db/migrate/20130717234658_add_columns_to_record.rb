class AddColumnsToRecord < ActiveRecord::Migration
  def change
    add_column :records, :user, :string
    add_column :records, :company, :string
    add_column :records, :job, :string
  end
end
