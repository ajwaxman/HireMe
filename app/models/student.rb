# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  has_many :interviews
  
  has_many :companies, :through => :interviews
  has_many :jobs, 		 :through => :interviews
  
end
