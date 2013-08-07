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
  has_many   :events, :through => :records

  default_scope :order => 'created_at ASC'

  include AASM

  aasm do
    state :start, :initial => true
    state :like
    state :interviewing
    state :pending
    state :user_decline
    state :company_decline
    state :offer_received
    state :offer_accepted
    state :offer_declined

    event :like_company do
      transitions :from => :start, :to => :like
    end

    event :unlike_company do
      transitions :from => :like, :to => :start
    end

    event :no_interview do
      transitions :from => :like, :to => :company_decline
    end

    event :start_interview do
      transitions :from => [:like, :start, :interviewing, :pending, :user_decline, :offer_received, :offer_accepted, :offer_declined], :to => :interviewing
    end

    event :post_interview do
      transitions :from => :interviewing, :to => :pending
    end

    event :user_declines do
      transitions :from => :pending, :to => :user_decline
    end

    event :company_declines do
      transitions :from => :pending, :to => :company_decline
    end

    event :receives_offer do
      transitions :from => :pending, :to => :offer_received
    end

    event :declines_offer do
      transitions :from => :offer_received, :to => :offer_declined
    end

    event :accepts_offer do
      transitions :from => :offer_received, :to => :offer_accepted
    end

  end

  # Find all IDs needed to establish relationship.
  def self.find_ids (job_id, user_id)
    c_id = Job.find(job_id).company_id
    j_id = job_id
    u_id = user_id

    return c_id, j_id, u_id
  end

  def self.establish_relationship (c_id, j_id, u_id, int)
    rel = Relationship.find_or_create_by_company_id_and_job_id_and_user_id(c_id, j_id, u_id)

    int.relationship_id = rel.id
    rel.interview_id    = int.id
    rel.start_interview

    return int, rel
  end

end

