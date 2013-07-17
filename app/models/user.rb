# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  has_many :relationships
  
  has_many :companies, 	:through => :relationships
  has_many :interviews, :through => :relationships
  has_many :jobs, 		 	:through => :relationships
  has_many :records, 		:through => :relationships
  
end
