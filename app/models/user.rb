# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  role            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :password, :password_confirmation, :role

  has_secure_password

  validates_uniqueness_of :email

  has_many :relationships
  
  has_many :companies, 	:through => :relationships
  has_many :interviews, :through => :relationships
  has_many :jobs, 		 	:through => :relationships
  has_many :records, 		:through => :relationships

  def admin?
    self.role == "admin"
  end

  def student?
    self.role == "student"
  end

  def guest?
    self.role == "guest"
  end

end
