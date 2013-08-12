class Comment < ActiveRecord::Base
  attr_accessible :interview_id, :notes, :questions, :user_id

  belongs_to :user
  belongs_to :interview
  
end
