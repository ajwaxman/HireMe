class Student < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  has_many :interviews
  
  has_many :companies, :through => :interviews
  has_many :jobs, 		 :through => :interviews
  
end
