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
#  hireable        :boolean
#

class User < ActiveRecord::Base

  attr_accessible :email, :name, :phone, :password, :password_confirmation, :role, :hireable

  has_many :relationships
  has_many :interviews
  
  has_many :companies, 	:through => :relationships
  has_many :jobs, 		 	:through => :relationships
  has_many :records, 		:through => :relationships
  has_many :comments

  # Validation of attributes #

  validates_presence_of   :name
  validates_presence_of   :email

  validates_uniqueness_of :email

  has_secure_password
  validates :password,
    :presence => true,
    :confirmation => true

  after_initialize :set_relationship_for_jobs

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

  #### uncomment to enable solar ####
  # searchable do
  #   text :name
  # end
  
  def relationship_for_job(job)
    @relationship_for_jobs[job.id] ||= if relationships.loaded?
      relationships.detect{|r| r.job_id == job.id }
    else
      relationships.where(:relationships => {:job_id => job.id}).first
    end
  end
  
  private
    def set_relationship_for_jobs
      @relationship_for_jobs ||= {}
    end
end
