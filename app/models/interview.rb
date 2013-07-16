class Interview < ActiveRecord::Base
  attr_accessible :company_id, :job_id, :status, :student_id

  belongs_to :company
  belongs_to :job
  belongs_to :student

  include AASM



  aasm do
    state :open_status, :initial => true
    state :in_progress
    state :close_status

    event :email do
      transitions :from => :open, :to => :in_progress
    end

    event :clean do
      transitions :from => :in_progress, :to => :closed
    end

  end
end
