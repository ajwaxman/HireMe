class Job < ActiveRecord::Base
  attr_accessible :company_id, :description, :title

  belongs_to :company
  has_many :interviews
  has_many :students, :through => :interviews

end
