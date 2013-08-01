module Validations::StartTime
	protected

	def validates_start_time_and_end_time
    errors.add(:base) unless !start_time.nil? && !end_time.nil? && (end_time > start_time)
  end

end