class Company < ActiveRecord::Base
  attr_accessible :name, :website

  has_many :interviews
  has_many :jobs
  has_many :students, :through => :interviews

end
