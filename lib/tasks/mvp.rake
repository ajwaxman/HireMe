namespace :db do
  desc "Seed database with data for MVP demo."
  task :mvp_seed => :environment do
    
  	## seed users table

		user_1 = User.create(
		  :email => "carlos@flatironschool.com",
		  :name => "Carlos Lazo",
		  :phone => "123-456-7890",
		  :role => "student"
		)

		user_2 = User.create(
		  :email => "chris@flatironschool.com",
		  :name => "Christopher Lake",
		  :phone => "098-765-4321",
		  :role => "student"
		)

		user_3 = User.create(
		  :email => "david@flatironschool.com",
		  :name => "David Manaster",
		  :phone => "111-222-3333",
		  :role => "student"
		)

		user_4 = User.create(
		  :email => "adam@flatironschool.com",
		  :name => "Adam Waxman",
		  :phone => "444-555-6666",
		  :role => "student"
		)

		user_5 = User.create(
		  :email => "avi@flatironschool.com",
		  :name => "Avi Flombaum",
		  :phone => "777-888-9999",
		  :role => "admin"
		)

		user_6 = User.create(
		  :email => "katie@flatironschool.com",
		  :name => "Katie Ishibashi",
		  :phone => "212-555-6666",
		  :role => "student"
		)

		user_7 = User.create(
		  :email => "ruthie@flatironschool.com",
		  :name => "Ruthie Nachmany",
		  :phone => "646-888-9999",
		  :role => "student"
		)

		user_8 = User.create(
		  :email => "kirin@flatironschool.com",
		  :name => "Kirin Masood",
		  :phone => "917-888-9999",
		  :role => "student"
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
		  :company_id => 3,
		  :description => "We're looking for a software architect to lead our team of developers here at Artsy.",
		  :title => "Senior Software Developer"
		)

		job_6 = Job.create(
		  :company_id => 4,
		  :description => "Facebook is seeking an experienced Software Engineer to join the Infrastructure Engineering team. The position is full-time and is based in our main office in Menlo Park, CA. There are minimal travel requirements for this position. Infrastructure Engineering builds large, distributed components that run Facebook. Our code serves millions of requests per second, and it does so with subsecond latency and in a fault tolerant manner. We handle everything from Facebook scale data storage, to synchronization and coordination of large server clusters, to providing a runtime environment for front end Facebook code. We are looking for candidates who share a passion for tackling complexity and building platforms that can scale through multiple orders of magnitude.
Responsibilities
Design core, backend software components
Code using primarily C/C++, Java, and PHP
Interface with other teams to incorporate their innovations and vice versa
Conduct design and code reviews
Analyze and improve efficiency, scalability, and stability of various system resources
Requirements
B.S. Computer Science or related field preferred
Extensive experience building large-scale server applications
Expert knowledge developing and debugging in C/C++ or Java/C#
Knowledge of Perl, PHP or Python a plus
Experience with operating system internals, filesystems, programming language design, compilers also a plus",
		  :title => "Haskell Developer"
		)

		job_7 = Job.create(
		  :company_id => 2,
		  :description => ""Betaworks is a large part of what’s moving us forward: inspiring us, competing with us, making us jealous and dismissive and goading our creative monsters to come out and play." - Wired
 
Are you an iOS engineer with an inexplicable urge to conquer mobile terrain like it’s the wild west? Are you excited by apps that hit the top of the app store in less than a week? Then hey, 
nice to meet you. We’re betaworks. 
 

About you: 
 
You are a creative, risky thinker with a track record of shipping. 
 
Experience building, testing and distributing iOS apps
Object Oriented programming skills in a client/server environment
Experience incorporating 3rd party APIs 
Strong mastery of Objective-C and the all the necessary tools (Xcode, iOS SDK, etc)
Experience working with web services, JSON, and XML
 

About us: 
 
We’re a studio of small dev-heavy teams with sharp product focus. Over the past few months, we’ve built 6 products that we’re incredibly excited about [see => Giphy, Dots, Telecast, Blend, Done Not Done and Poncho]. We’re also very invested in improving the consumption and discovery of content [see => Digg, Digg Reader, Instapaper, Bloglovin, and Tapestry] Check out betaworks.com for more information on all of our studio products, plus our investments, events and other internal media experiments. ",
		  :title => "Bondsy iOS Growth Hacker"
		)

		job_8 = Job.create(
		  :company_id => 3,
		  :description => "We're looking for a software architect to lead our team of developers here at Artsy.",
		  :title => "Super Senior Software Developer"
		)

		## seed interviews table

		interview_1 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-24",
		  :relationship_id => 1
		)

		interview_2 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-25",
		  :relationship_id => 2
		)

		interview_3 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-24",
		  :relationship_id => 3
		)

		interview_4 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-27",
		  :relationship_id => 4
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
		  :interview_id => 2, 
		  :user_id => 5
		)

		relationship_3 = Relationship.create(
		  :aasm_state => "open_status",
		  :company_id => 3,
		  :job_id => 3, 
		  :interview_id => 3, 
		  :user_id => 3
		)

		relationship_4 = Relationship.create(
		  :aasm_state => "open_status",
		  :company_id => 1,
		  :job_id => 5,
		  :interview_id => 4,
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