class Interview < ActiveRecord::Base
  attr_accessible :end_time, :relationship_id, :start_time

  belongs_to :relationship

  has_one :company, :through => :relationships
  has_one :job, 		:through => :relationships
  has_one :user, 		:through => :relationships

end
