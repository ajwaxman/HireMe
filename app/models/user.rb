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

  has_many :relationships
  
  has_many :companies, 	:through => :relationships
  has_many :interviews, :through => :relationships
  has_many :jobs, 		 	:through => :relationships
  has_many :records, 		:through => :relationships

  # Validation of attributes #

  validates_presence_of   :name
  validates_presence_of   :email

  validates_uniqueness_of :email

  has_secure_password
  validates :password,
    :presence => true,
    :confirmation => true

  ##########################
  # Authentication Methods #
  ##########################

  def admin?
    self.role == "admin"
  end

  def student?
    self.role == "student"
  end

  def guest?
    self.role == "guest"
  end

  def self.already_exists?(email)
    if !User.find_by_email(email).nil? == true
      flash[:alert] = "User with given email already exists."
      redirect_to signup_path
      return
    end
  end

end
