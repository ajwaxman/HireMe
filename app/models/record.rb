# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  relationship_id :integer
#  event           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Record < ActiveRecord::Base
  attr_accessible :event, :relationship_id, :company, :job, :user

  belongs_to :relationship

end
