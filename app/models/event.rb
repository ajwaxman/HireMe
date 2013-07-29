class Event < ActiveRecord::Base
  attr_accessible :description, :state

  has_many :records
  has_many :relationships, :through => :records
end