namespace :cron do
  desc "Updates Interviewing state to Pending after interview takes place."
  task :post_interview => :environment do

	relationships_with_interviews = Relationship.all.select {|rel| rel.aasm_state == "interviewing"}
	
	relationships_with_interviews.each do |rel|
		i = Interview.find(rel.interview_id)
		i_date = i.merge_datetime_object
		if i_date < Time.now
			rel.post_interview
			Record.write_record(rel) if rel.save
		end
		
	end

	end
end