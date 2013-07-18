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

    event :email do
      transitions :from => :open_status, :to => :interviewing
    end

    event :clean do
      transitions :from => :interviewing, :to => :close_status
    end

  end

  # def self.find_states()
  #   # Interview.where(aasm_state: state)
  #   puts "I see Carlos"
  # end

end

