# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  relationship_id :integer
#  event           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user            :string(255)
#  company         :string(255)
#  job             :string(255)
#

class Record < ActiveRecord::Base
  attr_accessible :relationship_id, :event_id, :company, :job, :user, :event

  belongs_to :relationship
  belongs_to :event

  default_scope :order => 'created_at DESC'

  # Write record based on current state of relationship.
	def self.write_record(rel)

		rec = Record.new(
				:relationship_id => rel.id,
				:company => rel.company.name,
				:job => rel.job.title,
				:user => rel.user.name)

		# These will be replaced with lookups from "event" model.
		# case rel.aasm_state
		# when "interviewing" 
		# 	rec.event = "#{rec.user} has an interview scheduled at #{rec.company} for the #{rec.job} position. It starts on #{rel.interview.start_time.strftime("%B %d at %I:%M %p")}"
		# end

		rec.save
	end

end