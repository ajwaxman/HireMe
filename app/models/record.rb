# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  relationship_id :integer
#  event           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Record < ActiveRecord::Base
  attr_accessible :event, :relationship_id, :company, :job, :user

  belongs_to :relationship

  default_scope :order => 'created_at DESC'

  # Create record based on current state of relationship.
	def self.create_record(rel)

		rec = Record.new(
				:relationship_id => rel.id,
				:company => rel.company.name,
				:job => rel.job.title,
				:user => rel.user.name)


		# These will be replaced with lookups from "event" model.
		case rel.aasm_state
		when "interviewing" 
			rec.event = "#{rec.user} has an interview scheduled at #{rec.company} for the #{rec.job} position. It starts on #{rel.interview.start_time.strftime("%B %d at %I:%M %p")}"
		end

		rec.save
	end

end

# :event => 