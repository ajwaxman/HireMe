class RenameRelationshipsToRelationships < ActiveRecord::Migration
  def change
    rename_table :relationships, :relationships
  end 
end
