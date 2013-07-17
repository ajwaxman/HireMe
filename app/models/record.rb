class Record < ActiveRecord::Base
  attr_accessible :event, :relationship_id

  belongs_to :relationship

end
