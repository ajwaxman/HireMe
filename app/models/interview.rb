class Interview < ActiveRecord::Base
  attr_accessible :company_id, :job_id, :status, :student_id

  belongs_to :company
  belongs_to :job
  belongs_to :student

  include AASM

  aasm do
    state :open, :initial => true
    state :in_progress
    state :closed

    event :email do
      transitions :from => :open, :to => :in_progress
    end

    event :clean do
      transitions :from => :in_progress, :to => :closed
    end

    event :sleep do
      transitions :from => [:running, :cleaning], :to => :sleeping
    end
  end

end


end
