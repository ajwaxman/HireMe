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

    # seed relationships table

    relationship_1 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 2,
    :job_id => 4,
    :user_id => 2
    )

    relationship_2 = Relationship.create(
    :aasm_state => "like",
    :company_id => 5,
    :job_id => 2, 
    :user_id => 7
    )

    relationship_3 = Relationship.create(
    :aasm_state => "like",
    :company_id => 3,
    :job_id => 3, 
    :user_id => 8
    )

    relationship_4 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 1,
    :job_id => 5,
    :user_id => 6
    )

    relationship_5 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 2,
    :job_id => 4,
    :user_id => 7
    )

    relationship_6 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 5,
    :job_id => 2, 
    :user_id => 8
    )

    relationship_7 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 3,
    :job_id => 3, 
    :user_id => 8
    )

    relationship_8 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 1,
    :job_id => 5,
    :user_id => 2
    )

    relationship_9 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 2,
    :job_id => 4,
    :user_id => 6
    )

    relationship_10 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 5,
    :job_id => 2, 
    :user_id => 5
    )

    relationship_11 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 3,
    :job_id => 3, 
    :user_id => 3
    )

    relationship_12 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 1,
    :job_id => 5,
    :user_id => 8
    )

    relationship_13 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 3,
    :job_id => 6, 
    :user_id => 7
    )

    relationship_14 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 1,
    :job_id => 7,
    :user_id => 8
    )

    relationship_15 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 2,
    :job_id => 6,
    :user_id => 8
    )

    relationship_16 = Relationship.create(
    :aasm_state => "like",
    :company_id => 5,
    :job_id => 5, 
    :user_id => 2
    )

    relationship_17 = Relationship.create(
    :aasm_state => "like",
    :company_id => 3,
    :job_id => 1, 
    :user_id => 1
    )

    relationship_18 = Relationship.create(
    :aasm_state => "like",
    :company_id => 1,
    :job_id => 8,
    :user_id => 6
    )

    relationship_19 = Relationship.create(
    :aasm_state => "interviewing",
    :company_id => 2,
    :job_id => 7,
    :user_id => 6
    )

    relationship_20 = Relationship.create(
    :aasm_state => "like",
    :company_id => 5,
    :job_id => 8, 
    :user_id => 8
    )

    ## seed records table

    record_1 = Record.create(
      :relationship_id => 1,
      :event_id => 1,
      :company => "Bondsy",
      :job => "Sinatra Developer",
      :user => "Christopher Lake"
    )

    record_2 = Record.create(
      :relationship_id => 1,
      :event_id => 3,
      :company => "Bondsy",
      :job => "Sinatra Developer",
      :user => "Christopher Lake"
    )

    record_3 = Record.create(
      :relationship_id => 2,
      :company => "Google",
      :job => "SQL Engineer",
      :user => "Avi Flombaum",
      :event_id => 1
    )

    record_4 = Record.create(
      :relationship_id => 3,
      :company => "Amazon",
      :job => "Rails Developer",
      :user => "David Manaster",
      :event_id => 3
    )

    record_5 = Record.create(
      :relationship_id => 4,
      :company => "Artsy",
      :job => "Senior Software Engineer",
      :user => "Christopher Lake",
      :event_id => 3
    )

    record_6 = Record.create(
      :relationship_id => 6,
      :company => "Bondsy",
      :job => "Sinatra Developer",
      :user => "Kirin Masood",
      :event_id => 3
    )

    record_7 = Record.create(
      :relationship_id => 7,
      :company => "Facebook",
      :job => "Sinatra Developer",
      :user => "Christopher Lake",
      :event_id => 3
    )

    record_8 = Record.create(
      :relationship_id => 8,
      :company => "Google",
      :job => "SQL Engineer",
      :user => "Adam Waxman",
      :event_id => 3
    )

    record_9 = Record.create(
      :relationship_id => 9,
      :company => "Amazon",
      :job => "Rails Developer",
      :user => "David Manaster",
      :event_id => 3
    )

    record_10 = Record.create(
      :relationship_id => 10,
      :company => "Artsy",
      :job => "Senior Software Engineer",
      :user => "Ruthie Nachmany",
      :event_id => 3
    )

    record_11 = Record.create(
      :relationship_id => 11,
      :company => "Artsy",
      :job => "iOS Growth Hacker",
      :user => "Ruthie Nachmany",
      :event_id => 3
    )

    record_12 = Record.create(
      :relationship_id => 12,
      :company => "Bondsy",
      :job => "Facebook Haskell Baller",
      :user => "Kirin Masood",
      :event_id => 3
    )

    record_13 = Record.create(
      :relationship_id => 11,
      :company => "Google",
      :job => "SQL Engineer",
      :user => "Katie Ishibashi",
      :event_id => 3
    )

    record_14 = Record.create(
      :relationship_id => 19,
      :company => "Amazon",
      :job => "Rails Developer",
      :user => "David Manaster",
      :event_id => 3
    )

    record_15 = Record.create(
      :relationship_id => 10,
      :company => "Artsy",
      :job => "Senior Software Engineer",
      :user => "Carlos Lazo",
      :event_id => 3
    )

    record_16 = Record.create(
      :relationship_id => 16,
      :company => "Bondsy",
      :job => "Sinatra Developer",
      :user => "Kirin Masood",
      :event_id => 1
    )

    record_17 = Record.create(
      :relationship_id => 17,
      :company => "Facebook",
      :job => "Sinatra Developer",
      :user => "Christopher Lake",
      :event_id => 1
    )

    record_18 = Record.create(
      :relationship_id => 18,
      :company => "Google",
      :job => "SQL Engineer",
      :user => "Katie Ishibashi",
      :event_id => 1
    )

    record_19 = Record.create(
      :relationship_id => 19,
      :company => "Amazon",
      :job => "Rails Developer",
      :user => "David Manaster",
      :event_id => 3
    )

    record_20 = Record.create(
      :relationship_id => 20,
      :company => "Artsy",
      :job => "Senior Software Engineer",
      :user => "Christopher Lake",
      :event_id => 1
    )

	end 

  puts "\nDatabase seed should now be seeded.\n\n"
end