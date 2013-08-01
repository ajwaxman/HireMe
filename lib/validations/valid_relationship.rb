module Validations::ValidRelationship
	protected

	def validate_presence_of_interview_or_like
		interview_id || aasm_state == "like"
  end

end