class Job < ActiveRecord::Base
  attr_accessible :company_id, :decription, :title

  belongs_to :company
  has_many :interviews

end
