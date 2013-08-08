class RemoveInterviewIdFromRelationship < ActiveRecord::Migration
  def change
    remove_column :relationships, :interview_id
  end
end
