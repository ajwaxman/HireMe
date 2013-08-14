namespace :db do
  desc "Seed our production DB."
  task :final_seed => :environment do

  	puts "Why did this one run?"

		user_1 = User.create(
      :email => "carlos.jose.lazo@gmail.com",
      :name => "Carlos Lazo",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_2 = User.create(
      :email => "chris@flatironschool.com",
      :name => "Christopher Lake",
      :phone => "098-765-4321",
      :role => "student",
      :hireable => false, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_3 = User.create(
      :email => "david@flatironschool.com",
      :name => "David Manaster",
      :phone => "111-222-3333",
      :role => "student",
      :hireable => false, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_4 = User.create(
      :email => "awaxman11@gmail.com",
      :name => "Adam Waxman",
      :phone => "444-555-6666",
      :role => "student",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_5 = User.create(
      :email => "avi@flatironschool.com",
      :name => "Avi Flombaum",
      :phone => "777-888-9999",
      :role => "admin",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_6 = User.create(
      :email => "katie@flatironschool.com",
      :name => "Katie Ishibashi",
      :phone => "212-555-6666",
      :role => "student",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_7 = User.create(
      :email => "ruthie@flatironschool.com",
      :name => "Ruthie Nachmany",
      :phone => "646-888-9999",
      :role => "student",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )

    user_8 = User.create(
      :email => "kirin@flatironschool.com",
      :name => "Kirin Masood",
      :phone => "917-888-9999",
      :role => "student",
      :hireable => true, 
      :password => 'acdc', 
      :password_confirmation => 'acdc'
    )
    ## seed companies and jobs tables

    jobs_and_companies = ["http://jobs.37signals.com/jobs/13318",
                          "http://jobs.37signals.com/jobs/13281",
                          "http://jobs.37signals.com/jobs/13319",
                          "http://jobs.37signals.com/jobs/13324",
                          "http://jobs.37signals.com/jobs/13326",
                          "http://jobs.37signals.com/jobs/13321",
                          "http://jobs.37signals.com/jobs/13316",
                          "http://jobs.37signals.com/jobs/13251",
                          "http://jobs.37signals.com/jobs/13322"]
    jobs_and_companies.each do |listing|
      job = ChromeJobAdder.new(listing)
      job.create_job_from_link
    end

    ## event table

    event_1 = Event.create(
      :description => "Job has been liked.",
      :state => "like"
    )

    event_2 = Event.create(
      :description => "Job has been un-liked.",
      :state       => "like"
    )

    event_3 = Event.create(
      :description => "Interview scheduled.",
      :state => "interviewing"
    )

    event_4 = Event.create(
      :description => "Interview is pending resolution.",
      :state => "pending"
    )

    event_5 = Event.create(
      :description => "User has received offer from company.",
      :state => "offer_received"
    )

    # End States for State Machine

    event_6 = Event.create(
      :description => "User has discontinued relationship with company.",
      :state => "user_decline"
    )

    event_7 = Event.create(
      :description => "Company has passed (for now).",
      :state => "company_decline"
    )

    event_8 = Event.create(
      :description => "User has accepted job offer from company.",
      :state => "offer_accepted"
    )

    event_9 = Event.create(
      :description => "User has declined job offer from company.",
      :state => "offer_declined"
    )

	end 

  puts "\nDatabase ready for production should now be seeded.\n\n"
end