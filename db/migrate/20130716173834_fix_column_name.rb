class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :relationships, :state, :aasm_state
  end
end
