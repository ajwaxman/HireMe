class AddStateToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :state, :string
  end
end
