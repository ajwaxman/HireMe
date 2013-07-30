# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :text
#

class Event < ActiveRecord::Base
  attr_accessible :description, :state

  has_many :records
  has_many :relationships, :through => :records
end
