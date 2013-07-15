class Interview < ActiveRecord::Base
  attr_accessible :company_id, :job_id, :status, :student_id

  belongs_to :company
  belongs_to :job
  belongs_to :student
end
