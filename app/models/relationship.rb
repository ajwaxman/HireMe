# == Schema Information
#
# Table name: relationships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  job_id       :integer
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  date_time    :datetime
#  aasm_state   :string(255)
#  interview_id :integer
#

class Relationship < ActiveRecord::Base
  attr_accessible :company_id, :interview_id, :job_id, :user_id, :aasm_state

  belongs_to :company
  belongs_to :job
  belongs_to :user
  belongs_to :interview
  
  has_many   :records

  default_scope :order => 'created_at ASC'

  include AASM

  aasm do
    state :open_status, :initial => true
    state :interviewing
    state :close_status

    event :start_interview do
      transitions :from => :open_status, :to => :interviewing
    end

    event :end_interview do
      transitions :from => :interviewing, :to => :close_status
    end

  end

  # Find all IDs needed to establish relationship.
  def self.find_ids (job_id, user_id)
    c_id = Job.find(job_id).company_id
    j_id = job_id
    u_id = user_id

    return c_id, j_id, u_id
  end

  # Establish relationship, along with interview, of models.
  def self.establish_relationship (params, c_id, j_id, u_id)

    int = Interview.new(params)
    rel = Relationship.find_or_create_by_company_id_and_job_id_and_user_id(c_id, j_id, u_id)

    int.relationship_id = rel.id
    rel.interview       = int
    rel.start_interview           # Interview is now in progress.

    return int, rel
  end

end

