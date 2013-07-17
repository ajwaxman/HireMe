class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :interviews, :state, :aasm_state
  end
end
