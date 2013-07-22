namespace :db do
  desc "Seed database with data for MVP demo."
  task :mvp_seed => :environment do
    
  	## seed users table

		user_1 = User.create(
		  :email => "carlos.lazo@flatironschool.com",
		  :name => "Carlos Lazo",
		  :phone => "123-456-7890"
		)

		user_2 = User.create(
		  :email => "chris.lake@flatironschool.com",
		  :name => "Christopher Lake",
		  :phone => "098-765-4321"
		)

		user_3 = User.create(
		  :email => "david.manaster@flatironschool.com",
		  :name => "David Manaster",
		  :phone => "111-222-3333"
		)

		user_4 = User.create(
		  :email => "adam.waxman@flatironschool.com",
		  :name => "Adam Waxman",
		  :phone => "444-555-6666"
		)

		user_5 = User.create(
		  :email => "avi@flatironschool.com",
		  :name => "Avi Flombaum",
		  :phone => "777-888-9999"
		)

		## seed companies table

		company_1 = Company.create(
		  :name => "Artsy",
		  :website => "http://artsy.net/"
		)

		company_2 = Company.create(
		  :name => "Bondsy",
		  :website => "http://www.bondsy.com/"
		)

		company_3 = Company.create(
		  :name => "Amazon",
		  :website => "http://www.amazon.com/"
		)

		company_4 = Company.create(
		  :name => "Facebook",
		  :website => "http://www.facebook.com/"
		)

		company_5 = Company.create(
		  :name => "Google",
		  :website => "http://www.google.com/"
		)

		## seed jobs table

		job_1 = Job.create(
		  :company_id => 1,
		  :description => "We're looking for a great Ruby developer to join the Artsy Team.",
		  :title => "Ruby Developer"
		)

		job_2 = Job.create(
		  :company_id => 5,
		  :description => "Hate your life everyday working for us - everyday you're hustlin'.",
		  :title => "SQL Engineer"
		)

		job_3 = Job.create(
		  :company_id => 3,
		  :description => "Looking for someone to join our balling out team, but you have to live in Seattle.",
		  :title => "Rails Developer"
		)

		job_4 = Job.create(
		  :company_id => 2,
		  :description => "Apply only if you're a good singer.",
		  :title => "Sinatra Developer"
		)

		job_5 = Job.create(
		  :company_id => 1,
		  :description => "We're looking for a software architect to lead our team of developers here at Artsy.",
		  :title => "Senior Software Developer"
		)

		## seed interviews table

		interview_1 = Interview.create(
		  :start_time => "08:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-09-15",
		  :relationship_id => 1
		)
		
		## seed relationships table

		relationship_1 = Relationship.create(
		  :aasm_state => "interviewing",
		  :company_id => 2,
		  :job_id => 4,
		  :interview_id => 1, 
		  :user_id => 2
		)

		relationship_2 = Relationship.create(
		  :aasm_state => "open_status",
		  :company_id => 5,
		  :job_id => 2, 
		  :user_id => 5
		)

		relationship_3 = Relationship.create(
		  :aasm_state => "open_status",
		  :company_id => 3,
		  :job_id => 3, 
		  :user_id => 3
		)

		relationship_4 = Relationship.create(
		  :aasm_state => "open_status",
		  :company_id => 1,
		  :job_id => 5, 
		  :user_id => 2
		)
		## seed records table

		record_1 = Record.create(
		  :relationship_id => 1,
		  :company => "Bondsy",
		  :job => "Sinatra Developer",
		  :user => "Christopher Lake",
		  :event => "Christopher Lake liked the Sinatra Developer position at Bondsy."
		)

		record_2 = Record.create(
		  :relationship_id => 1,
		  :company => "Bondsy",
		  :job => "Sinatra Developer",
		  :user => "Christopher Lake",
		  :event => "Christopher Lake has an interview scheduled at Bondsy for the Sinatara Developer position. It starts on September 15, 2013 at 1pm."
		)

		record_3 = Record.create(
		  :relationship_id => 2,
		  :company => "Google",
		  :job => "SQL Engineer",
		  :user => "Avi Flombaum",
		  :event => "Avi Flombaum liked the SQL Engineer position at Google."
		)

		record_4 = Record.create(
		  :relationship_id => 3,
		  :company => "Amazon",
		  :job => "Rails Developer",
		  :user => "David Manaster",
		  :event => "David Manaster liked the Rails Developer position at Amazon."
		)

		record_5 = Record.create(
		  :relationship_id => 4,
		  :company => "Artsy",
		  :job => "Senior Software Engineer",
		  :user => "Christopher Lake",
		  :event => "Christopher Lake liked the Senior Software Engineer position at Artsy."
		)

		puts "\nRake task completed - database should now be seeded for MVP.\n"

  end
end