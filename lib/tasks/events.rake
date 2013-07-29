namespace :db do
	desc "Seed database with Event list."
	task :create_events => :environment do
		event_1 = Event.create(
			:description => "Job has been liked.",
			:state => "like"
		)

		event_2 = Event.create(
			:description => "Interview scheduled.",
			:state => "interviewing"
		)

		event_3 = Event.create(
			:description => "Interview is pending resolution.",
			:state => "pending"
		)

		event_4 = Event.create(
			:description => "User has received offer from company.",
			:state => "offer_received"
		)

		# End States for State Machine

		event_5 = Event.create(
			:description => "User has discontinued relationship with company.",
			:state => "user_decline"
		)

		event_6 = Event.create(
			:description => "User has declined job offer from company.",
			:state => "company_decline"
		)

		event_7 = Event.create(
			:description => "User has accepted job offer from company.",
			:state => "offer_accepted"
		)

		event_8 = Event.create(
			:description => "User has declined job offer from company.",
			:state => "offer_declined"
		)

	end
end