class RenameInterviewsToRelationships < ActiveRecord::Migration
  def change
    rename_table :interviews, :relationships
  end 
end
