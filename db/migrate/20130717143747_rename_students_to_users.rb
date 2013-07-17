class RenameStudentsToUsers < ActiveRecord::Migration
  def change
    rename_table :students, :users
  end 
end
