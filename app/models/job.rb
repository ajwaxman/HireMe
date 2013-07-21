# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  attr_accessible :company_id, :description, :title

  belongs_to :company

  has_many :relationships

  has_many :interviews, :through => :relationships
  has_many :records, 		:through => :relationships
  has_many :users, 			:through => :relationships

	# Find all IDs needed to establish relationship.
	def self.find_ids (job_id, user_id)
		c_id = Job.find(job_id).company_id
  	j_id = job_id
  	u_id = user_id

		return c_id, j_id, u_id
	end

	# Establish relationship, along with interview, of models.
	def self.establish_relationship (params, c_id, j_id, u_id)

		int = Interview.new(params)
		rel = Relationship.find_or_create_by_company_id_and_job_id_and_user_id(c_id, j_id, u_id)

		int.relationship_id	= rel.id
		rel.interview 			= int
		rel.start_interview						# Interview is now in progress.

		return int, rel
	end

end