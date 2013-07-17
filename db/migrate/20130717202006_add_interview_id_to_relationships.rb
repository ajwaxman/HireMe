class AddInterviewIdToRelationships < ActiveRecord::Migration
  def change
  	add_column :relationships, :interview_id, :integer
  end
end
