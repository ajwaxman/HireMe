class AddStateToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :state, :string
  end
end
