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
		  :website => "http://artsy.net/",
		  :logo_url => "http://s3.amazonaws.com/crunchbase_prod_assets/assets/images/resized/0008/2612/82612v6-max-250x250.png"
		)

		company_2 = Company.create(
		  :name => "Bondsy",
		  :website => "http://www.bondsy.com/",
		  :logo_url => "http://s3.amazonaws.com/crunchbase_prod_assets/assets/images/resized/0018/2288/182288v4-max-250x250.png"
		)

		company_3 = Company.create(
		  :name => "Amazon",
		  :website => "http://www.amazon.com/",
		  :logo_url => "http://s3.amazonaws.com/crunchbase_prod_assets/assets/images/resized/0000/3898/3898v1-max-250x250.jpg"
		)

		company_4 = Company.create(
		  :name => "Facebook",
		  :website => "http://www.facebook.com/",
		  :logo_url => "http://s3.amazonaws.com/crunchbase_prod_assets/assets/images/resized/0000/4561/4561v1-max-250x250.png"
		)

		company_5 = Company.create(
		  :name => "Google",
		  :website => "http://www.google.com/",
		  :logo_url => "http://s3.amazonaws.com/crunchbase_prod_assets/assets/images/resized/0002/9578/29578v31-max-250x250.png"
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
		  :description => "Sustainable sunt anim assumenda pop-up semiotics meggings, brunch mollit church-key kale chips synth Odd Future. Disrupt hashtag esse polaroid Brooklyn street art. Ea wayfarers narwhal, yr vegan assumenda nostrud. Ullamco thundercats flannel aliquip, mollit fanny pack organic aute esse. Cosby sweater bespoke keytar aesthetic. Brooklyn voluptate assumenda try-hard ut, laborum wayfarers lo-fi pickled mustache pork belly iPhone nesciunt et chillwave. Aute proident meggings stumptown, exercitation brunch direct trade irure food truck.Ethical bicycle rights nesciunt, chillwave viral est cliche street art reprehenderit dolor irure church-key blue bottle swag Terry Richardson. Magna labore narwhal, mlkshk wolf Odd Future selfies mollit aliquip nihil deep v qui stumptown. Before they sold out lo-fi lomo cornhole id, craft beer twee shoreditch wolf small batch umami. Exercitation pug commodo narwhal, pop-up nihil nisi butcher letterpress intelligentsia blog ullamco consectetur. DIY tofu Marfa, enim freegan YOLO pour-over hoodie biodiesel post-ironic blog art party Terry Richardson magna deserunt. Est consectetur chambray bespoke. Gluten-free stumptown bicycle rights, Cosby sweater skateboard irony try-hard quis assumenda +1 tofu cupidatat craft beer.",
		  :title => "Haskell Developer"
		)

		job_7 = Job.create(
		  :company_id => 2,
		  :description => "Esse master cleanse 90's qui asymmetrical iPhone, cupidatat gastropub pitchfork fugiat Truffaut bespoke food truck tote bag. Keffiyeh nulla assumenda, sed irony adipisicing keytar deep v kale chips vero chillwave. Craft beer occaecat ullamco ut Godard actually. Nulla odio craft beer stumptown, velit next level vero ethnic. Pariatur irony blog fap freegan. Commodo american apparel cred, church-key yr beard pickled vero PBR butcher in stumptown. Single-origin coffee et veniam +1 cliche post-ironic, banjo ethnic you probably haven't heard of them",
		  :title => "iOS Growth Hacker"
		)

		job_8 = Job.create(
		  :company_id => 3,
		  :description => "Delectus mlkshk 3 wolf moon art party. Godard post-ironic occaecat chillwave gentrify Tonx scenester, dolore meggings tousled proident. Occaecat 3 wolf moon eu trust fund labore. IPhone cray craft beer, PBR anim adipisicing non church-key deserunt. Chillwave selvage cray biodiesel. 90's Neutra adipisicing, banjo viral High Life leggings 3 wolf moon bitters mlkshk. Cosby sweater enim Echo Park, cillum deserunt iPhone quis american apparel selvage try-hard delectus.",
		  :title => "Super Senior Software Developer"
		)

		## seed interviews table

		interview_1 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-26",
		  :relationship_id => 1
		)

		interview_2 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-28",
		  :relationship_id => 2
		)

		interview_3 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-29",
		  :relationship_id => 3
		)

		interview_4 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-27",
		  :relationship_id => 4
		)

		interview_5 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-26",
		  :relationship_id => 5
		)

		interview_6 = Interview.create(
		  :start_time => "14:00:00 EST",
		  :end_time => "15:00:00 EST",
		  :date => "2013-07-30",
		  :relationship_id => 6
		)

		interview_7 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-24",
		  :relationship_id => 7
		)

		interview_8 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-29",
		  :relationship_id => 8
		)

		interview_9 = Interview.create(
		  :start_time => "15:00:00 EST",
		  :end_time => "16:00:00 EST",
		  :date => "2013-07-29",
		  :relationship_id => 9
		)

		interview_10 = Interview.create(
		  :start_time => "10:00:00 EST",
		  :end_time => "11:00:00 EST",
		  :date => "2013-07-28",
		  :relationship_id => 110
		)

		interview_11 = Interview.create(
		  :start_time => "12:00:00 EST",
		  :end_time => "13:00:00 EST",
		  :date => "2013-07-29",
		  :relationship_id => 11
		)

		interview_12 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-25",
		  :relationship_id => 12
		)

		interview_13 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-29",
		  :relationship_id => 13
		)

		interview_14 = Interview.create(
		  :start_time => "15:00:00 EST",
		  :end_time => "16:00:00 EST",
		  :date => "2013-07-27",
		  :relationship_id => 14
		)

		interview_15 = Interview.create(
		  :start_time => "16:00:00 EST",
		  :end_time => "17:00:00 EST",
		  :date => "2013-07-28",
		  :relationship_id => 15
		)

		interview_16 = Interview.create(
		  :start_time => "09:00:00 EST",
		  :end_time => "10:00:00 EST",
		  :date => "2013-07-28",
		  :relationship_id => 16
		)

		interview_17 = Interview.create(
		  :start_time => "11:30:00 EST",
		  :end_time => "12:30:00 EST",
		  :date => "2013-07-31",
		  :relationship_id => 17
		)

		interview_18 = Interview.create(
		  :start_time => "11:00:00 EST",
		  :end_time => "12:00:00 EST",
		  :date => "2013-07-28",
		  :relationship_id => 18
		)

		interview_19 = Interview.create(
		  :start_time => "15:00:00 EST",
		  :end_time => "16:00:00 EST",
		  :date => "2013-07-30",
		  :relationship_id => 19
		)

		interview_20 = Interview.create(
		  :start_time => "09:30:00 EST",
		  :end_time => "10:30:00 EST",
		  :date => "2013-07-31",
		  :relationship_id => 20
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
		:user_id => 7
		)

		relationship_3 = Relationship.create(
		:aasm_state => "open_status",
		:company_id => 3,
		:job_id => 3, 
		:interview_id => 3, 
		:user_id => 8
		)

		relationship_4 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 1,
		:job_id => 5,
		:interview_id => 4,
		:user_id => 6
		)

		relationship_5 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 2,
		:job_id => 4,
		:interview_id => 5, 
		:user_id => 7
		)

		relationship_6 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 5,
		:job_id => 2, 
		:interview_id => 6, 
		:user_id => 8
		)

		relationship_7 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 3,
		:job_id => 3, 
		:interview_id => 7, 
		:user_id => 8
		)

		relationship_8 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 1,
		:job_id => 5,
		:interview_id => 8,
		:user_id => 2
		)

		relationship_9 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 2,
		:job_id => 4,
		:interview_id => 9, 
		:user_id => 6
		)

		relationship_10 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 5,
		:job_id => 2, 
		:interview_id => 10, 
		:user_id => 5
		)

		relationship_11 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 3,
		:job_id => 3, 
		:interview_id => 11, 
		:user_id => 3
		)

		relationship_12 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 1,
		:job_id => 5,
		:interview_id => 12,
		:user_id => 8
		)

		relationship_13 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 3,
		:job_id => 6, 
		:interview_id => 13, 
		:user_id => 7
		)

		relationship_14 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 1,
		:job_id => 7,
		:interview_id => 14,
		:user_id => 8
		)

		relationship_15 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 2,
		:job_id => 6,
		:interview_id => 15, 
		:user_id => 8
		)

		relationship_16 = Relationship.create(
		:aasm_state => "open_status",
		:company_id => 5,
		:job_id => 5, 
		:interview_id => 16, 
		:user_id => 2
		)

		relationship_17 = Relationship.create(
		:aasm_state => "open_status",
		:company_id => 3,
		:job_id => 1, 
		:interview_id => 17, 
		:user_id => 1
		)

		relationship_18 = Relationship.create(
		:aasm_state => "open_status",
		:company_id => 1,
		:job_id => 8,
		:interview_id => 18,
		:user_id => 6
		)

		relationship_19 = Relationship.create(
		:aasm_state => "interviewing",
		:company_id => 2,
		:job_id => 7,
		:interview_id => 19, 
		:user_id => 6
		)

		relationship_20 = Relationship.create(
		:aasm_state => "open_status",
		:company_id => 5,
		:job_id => 8, 
		:interview_id => 20, 
		:user_id => 8
		)

		## seed events table

		event_1 = Event.create(
			:description => "<%=record.user%> has liked the <%=record.job%> position at <%=record.company%>.")

		event_2 = Event.create(
			:description => "<%=record.user%> has an interview scheduled at <%=record.company%> for the <%=record.job%> position. It starts on <%=record.relationship.interview.start_time.strftime('%B %d at %I:%M %p')%>")

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
		  :event_id => 2,
		  :company => "Bondsy",
		  :job => "Sinatra Developer",
		  :user => "Christopher Lake"
		)

		# record_3 = Record.create(
		#   :relationship_id => 2,
		#   :company => "Google",
		#   :job => "SQL Engineer",
		#   :user => "Avi Flombaum",
		#   :event => "Avi Flombaum liked the SQL Engineer position at Google."
		# )

		# record_4 = Record.create(
		#   :relationship_id => 3,
		#   :company => "Amazon",
		#   :job => "Rails Developer",
		#   :user => "David Manaster",
		#   :event => "David Manaster liked the Rails Developer position at Amazon."
		# )

		# record_5 = Record.create(
		#   :relationship_id => 4,
		#   :company => "Artsy",
		#   :job => "Senior Software Engineer",
		#   :user => "Christopher Lake",
		#   :event => "Christopher Lake liked the Senior Software Engineer position at Artsy."
		# )

		# record_6 = Record.create(
		#   :relationship_id => 6,
		#   :company => "Bondsy",
		#   :job => "Sinatra Developer",
		#   :user => "Kirin Masood",
		#   :event => "Kirin Masood liked the Sinatra Developer position at Bondsy."
		# )

		# record_7 = Record.create(
		#   :relationship_id => 7,
		#   :company => "Facebook",
		#   :job => "Sinatra Developer",
		#   :user => "Christopher Lake",
		#   :event => "Christopher Lake has an interview scheduled at Facebook for the Sinatara Developer position. It starts on July 28, 2013 at 10am."
		# )

		# record_8 = Record.create(
		#   :relationship_id => 8,
		#   :company => "Google",
		#   :job => "SQL Engineer",
		#   :user => "Adam Waxman",
		#   :event => "Adam Waxman liked the SQL Engineer position at Google."
		# )

		# record_9 = Record.create(
		#   :relationship_id => 9,
		#   :company => "Amazon",
		#   :job => "Rails Developer",
		#   :user => "David Manaster",
		#   :event => "David Manaster liked the Rails Developer position at Amazon."
		# )

		# record_10 = Record.create(
		#   :relationship_id => 10,
		#   :company => "Artsy",
		#   :job => "Senior Software Engineer",
		#   :user => "Ruthie Nachmany",
		#   :event => "Ruthie Nachmany liked the Senior Software Engineer position at Artsy."
		# )

		# record_11 = Record.create(
		#   :relationship_id => 11,
		#   :company => "Artsy",
		#   :job => "iOS Growth Hacker",
		#   :user => "Ruthie Nachmany",
		#   :event => "Ruthie Nachmany liked the iOS Growth Hacker position at Artsy."
		# )

		# record_12 = Record.create(
		#   :relationship_id => 12,
		#   :company => "Bondsy",
		#   :job => "Facebook Haskell Baller",
		#   :user => "Kirin Masood",
		#   :event => "Kirin Masood has an interview scheduled at Bondsy for the Facebook Haskell position. It starts on July 30, 2013 at 1pm."
		# )

		# record_13 = Record.create(
		#   :relationship_id => 11,
		#   :company => "Google",
		#   :job => "SQL Engineer",
		#   :user => "Katie Ishibashi",
		#   :event => "Katie Ishibashi liked the SQL Engineer position at Google."
		# )

		# record_14 = Record.create(
		#   :relationship_id => 19,
		#   :company => "Amazon",
		#   :job => "Rails Developer",
		#   :user => "David Manaster",
		#   :event => "David Manaster liked the Rails Developer position at Amazon."
		# )

		# record_15 = Record.create(
		#   :relationship_id => 10,
		#   :company => "Artsy",
		#   :job => "Senior Software Engineer",
		#   :user => "Carlos Lazo",
		#   :event => "Carlos Lazo liked the Senior Software Engineer position at Artsy."
		# )

		# record_16 = Record.create(
		#   :relationship_id => 16,
		#   :company => "Bondsy",
		#   :job => "Sinatra Developer",
		#   :user => "Kirin Masood",
		#   :event => "Kirin Masood liked the Sinatra Developer position at Bondsy."
		# )

		# record_17 = Record.create(
		#   :relationship_id => 17,
		#   :company => "Facebook",
		#   :job => "Sinatra Developer",
		#   :user => "Christopher Lake",
		#   :event => "Christopher Lake has an interview scheduled at Facebook for the Sinatara Developer position. It starts on July 30, 2013 at 1pm."
		# )

		# record_18 = Record.create(
		#   :relationship_id => 18,
		#   :company => "Google",
		#   :job => "SQL Engineer",
		#   :user => "Katie Ishibashi",
		#   :event => "Katie Ishibashi liked the SQL Engineer position at Google."
		# )

		# record_19 = Record.create(
		#   :relationship_id => 19,
		#   :company => "Amazon",
		#   :job => "Rails Developer",
		#   :user => "David Manaster",
		#   :event => "David Manaster liked the Rails Developer position at Amazon."
		# )

		# record_20 = Record.create(
		#   :relationship_id => 20,
		#   :company => "Artsy",
		#   :job => "Senior Software Engineer",
		#   :user => "Christopher Lake",
		#   :event => "Christopher Lake liked the Senior Software Engineer position at Artsy."
		# )

		puts "\nRake task completed - database should now be seeded for MVP.\n"

  end
end