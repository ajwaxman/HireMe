# == Schema Information
#
# Table name: interviews
#
#  id         :integer          not null, primary key
#  student_id :integer
#  job_id     :integer
#  company_id :integer
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date_time  :datetime
#

class Interview < ActiveRecord::Base
  attr_accessible :company_id, :job_id, :status, :student_id, :date_time, :aasm_state

  belongs_to :company
  belongs_to :job
  belongs_to :student

  default_scope :order => 'date_time ASC'

  include AASM

  aasm do
    state :open_status, :initial => true
    state :in_progress
    state :close_status

    # event :email do
    #   transitions :from => :open, :to => :in_progress
    # end

    # event :clean do
    #   transitions :from => :in_progress, :to => :closed
    # end

  end

  # def self.find_states()
  #   # Interview.where(aasm_state: state)
  #   puts "I see Carlos"
  # end

end

