namespace :db do
  desc "Seed demo database."
  task :example_seed => :environment do

    user_1 = User.create(
      :email => "student@example.com",
      :name => "John Smith",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_2 = User.create(
      :email => "miley@example.com",
      :name => "Miley Cyrus",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_3 = User.create(
      :email => "lebron@example.com",
      :name => "Lebron James",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_4 = User.create(
      :email => "lionel@example.com",
      :name => "Lionel Messi",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_5 = User.create(
      :email => "macklemore@example.com",
      :name => "Macklemore",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_6 = User.create(
      :email => "michael@example.com",
      :name => "Michael Bluth",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    user_7 = User.create(
      :email => "george@example.com",
      :name => "George Michael",
      :phone => "123-456-7890",
      :role => "student",
      :hireable => true, 
      :password => 'student', 
      :password_confirmation => 'student'
    )

    admin_1 = User.create(
      :email => "admin@example.com",  
      :name => "Example Admin",
      :phone => "123-456-7890",
      :role => "admin",
      :hireable => true, 
      :password => 'admin', 
      :password_confirmation => 'admin'
    ) 

    # Add Twitter, Facebook, Google, Yahoo, and Foursquare as seed companies

    ChromeJobAdder.new("http://www.crunchbase.com/company/twitter").create_job_from_link
    company_1 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/facebook").create_job_from_link
    company_2 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/google").create_job_from_link
    company_3 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/yahoo").create_job_from_link
    company_4 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/foursquare").create_job_from_link
    company_5 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/groupme").create_job_from_link
    company_6 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/buzzfeed").create_job_from_link
    company_7 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/vine").create_job_from_link
    company_8 = Company.last

    ChromeJobAdder.new("http://www.crunchbase.com/company/instagram").create_job_from_link
    company_9 = Company.last


    job_1 = Job.create(
      :company_id => company_1.id,
      :title => "Junior Ruby Developer",
      :description => "Join the Flock and help put a dent in the universe as a Junior Ruby Developer at Twitter!"
    )

    job_2 = Job.create(
      :company_id => company_2.id,
      :title => "Junior iOS Developer",
      :description => "Join the largest social network and become an integral part of the mobile team as a junior iOS engieneer!"
    )

    job_3 = Job.create(
      :company_id => company_3.id,
      :title => "Junior Ruby Developer",
      :description => "Join Google's NYC team as a Ruby Engineer! You will get to work on all types of projects, from the new gmail to driverless cars!"
    )

    job_4 = Job.create(
      :company_id => company_4.id,
      :title => "Junior Ruby Developer",
      :description => "Come be a part of the new Yahoo! team as we revamp all our existing websites!"
    )

    job_5 = Job.create(
      :company_id => company_5.id,
      :title => "Junior iOS Developer",
      :description => "Join our team as we continue to help create the world's most complete and easy to use local business data layer!"
    )

    job_6 = Job.create(
      :company_id => company_6.id,
      :title => "Junior iOS Developer",
      :description => "Come be part of the team changing the way people connect through group messaging!"
    )

    job_7 = Job.create(
      :company_id => company_7.id,
      :title => "Junior Ruby Developer",
      :description => "Top 25 reasons why you should join BuzzFeed as a junior developer...!"
    )

    job_8 = Job.create(
      :company_id => company_8.id,
      :title => "Junior Ruby Developer",
      :description => "You have 6 seconds to tell you why we should hire you! Give us your best shot!"
    )

    job_9 = Job.create(
      :company_id => company_9.id,
      :title => "Junior Ruby Developer",
      :description => "Come help the world's leader in photo and video sharing!"
    )

    ## event table

    event_1 = Event.create(
      :description => "Job has been liked.",
      :state => "like"
    )

    event_2 = Event.create(
      :description => "Job has been unliked.",
      :state       => "start"
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

    ####################################
    #### SETUP EXAMPLE STUDENT DATA ####
    ####################################

    # Setup relationship, like job 1 and add an interview for the next day at 10am

    relationship_1 = Relationship.create(:user_id => user_1.id, :job_id => job_1.id, :company_id => job_1.company_id)
    relationship_1.like_company
    Record.write_record(relationship_1) if relationship_1.save

    interview_1 = Interview.create(
      :relationship_id => relationship_1.id,
      :date => (Time.now + 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,10,0,0),
      :end_time => DateTime.new(2001,2,3,11,0,0),
      :user_id => relationship_1.user_id,
      :job_id => relationship_1.job_id
    )

    relationship_1.start_interview
    Record.write_record(relationship_1) if relationship_1.save


    # Setup relationship, like job 2 and add an interview for the next day at 8am

    relationship_2 = Relationship.create(:user_id => user_1.id, :job_id => job_2.id, :company_id => job_2.company_id)
    relationship_2.like_company
    Record.write_record(relationship_2) if relationship_2.save

    interview_2 = Interview.create(
      :relationship_id => relationship_2.id,
      :date => (Time.now + 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,8,0,0),
      :end_time => DateTime.new(2001,2,3,9,0,0),
      :user_id => relationship_2.user_id,
      :job_id => relationship_2.job_id
    )

    relationship_2.start_interview
    Record.write_record(relationship_2) if relationship_2.save

    # Setup relationship, like job 3 and add an interview for the previous day at 8am

    relationship_3 = Relationship.create(:user_id => user_1.id, :job_id => job_3.id, :company_id => job_3.company_id)
    relationship_3.like_company
    Record.write_record(relationship_3) if relationship_3.save

    interview_3 = Interview.create(
      :relationship_id => relationship_3.id,
      :date => (Time.now - 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,8,0,0),
      :end_time => DateTime.new(2001,2,3,9,0,0),
      :user_id => relationship_3.user_id,
      :job_id => relationship_3.job_id
    )

    relationship_3.start_interview
    Record.write_record(relationship_3) if relationship_3.save

    relationship_3.post_interview
    Record.write_record(relationship_3) if relationship_3.save

    # Setup relationship, like job 4 and add an interview for the two days ago at 11am

    relationship_4 = Relationship.create(:user_id => user_1.id, :job_id => job_4.id, :company_id => job_4.company_id)
    relationship_4.like_company
    Record.write_record(relationship_4) if relationship_4.save

    interview_4 = Interview.create(
      :relationship_id => relationship_4.id,
      :date => (Time.now - 2.day).to_date,
      :start_time => DateTime.new(2001,2,3,11,0,0),
      :end_time => DateTime.new(2001,2,3,12,0,0),
      :user_id => relationship_4.user_id,
      :job_id => relationship_4.job_id
    )

    relationship_4.start_interview
    Record.write_record(relationship_4) if relationship_4.save

    relationship_4.post_interview
    Record.write_record(relationship_4) if relationship_4.save

    # Setup relationship, like job 5 and add an interview for the 4 days ago at 9am

    relationship_5 = Relationship.create(:user_id => user_1.id, :job_id => job_5.id, :company_id => job_5.company_id)
    relationship_5.like_company
    Record.write_record(relationship_5) if relationship_5.save

    interview_5 = Interview.create(
      :relationship_id => relationship_5.id,
      :date => (Time.now - 4.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_5.user_id,
      :job_id => relationship_5.job_id
    )

    relationship_5.start_interview
    Record.write_record(relationship_5) if relationship_5.save

    relationship_5.post_interview
    Record.write_record(relationship_5) if relationship_5.save

    # Setup relationship, like job 9

    relationship_6 = Relationship.create(:user_id => user_1.id, :job_id => job_9.id, :company_id => job_9.company_id)
    relationship_6.like_company
    Record.write_record(relationship_6) if relationship_6.save

    #########################################
    #### SETUP OTHER USER DATA FOR ADMIN ####
    #########################################

    # Setup relationship for user 2, like job 7 and add an interview for 3 days ago at 8am

    relationship_6 = Relationship.create(:user_id => user_2.id, :job_id => job_7.id, :company_id => job_7.company_id)
    relationship_6.like_company
    Record.write_record(relationship_6) if relationship_6.save

    interview_6 = Interview.create(
      :relationship_id => relationship_6.id,
      :date => (Time.now - 3.day).to_date,
      :start_time => DateTime.new(2001,2,3,8,0,0),
      :end_time => DateTime.new(2001,2,3,9,0,0),
      :user_id => relationship_6.user_id,
      :job_id => relationship_6.job_id
    )

    relationship_6.start_interview
    Record.write_record(relationship_6) if relationship_6.save

    relationship_6.post_interview
    Record.write_record(relationship_6) if relationship_6.save

    # Setup relationship with user 3, like job 3 and add an interview for the next day at 10am

    relationship_7 = Relationship.create(:user_id => user_3.id, :job_id => job_3.id, :company_id => job_3.company_id)
    relationship_7.like_company
    Record.write_record(relationship_7) if relationship_7.save

    interview_7 = Interview.create(
      :relationship_id => relationship_7.id,
      :date => (Time.now + 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,10,0,0),
      :end_time => DateTime.new(2001,2,3,11,0,0),
      :user_id => relationship_7.user_id,
      :job_id => relationship_7.job_id
    )

    relationship_7.start_interview
    Record.write_record(relationship_7) if relationship_7.save

    # Setup relationship with user 4, like job 4 and add an interview for 5 days ago at 11am and receive offer

    relationship_8 = Relationship.create(:user_id => user_4.id, :job_id => job_4.id, :company_id => job_4.company_id)
    relationship_8.like_company
    Record.write_record(relationship_8) if relationship_8.save

    interview_8 = Interview.create(
      :relationship_id => relationship_8.id,
      :date => (Time.now + 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,11,0,0),
      :end_time => DateTime.new(2001,2,3,12,0,0),
      :user_id => relationship_8.user_id,
      :job_id => relationship_8.job_id
    )

    relationship_8.start_interview
    Record.write_record(relationship_8) if relationship_8.save

    relationship_8.post_interview
    Record.write_record(relationship_8) if relationship_8.save

    relationship_8.receives_offer
    Record.write_record(relationship_8) if relationship_8.save

    # Setup relationship with user 5, like job 8 and add an interview for 3 days ago at 9am and receive offer

    relationship_9 = Relationship.create(:user_id => user_5.id, :job_id => job_8.id, :company_id => job_8.company_id)
    relationship_9.like_company
    Record.write_record(relationship_8) if relationship_8.save

    interview_9 = Interview.create(
      :relationship_id => relationship_9.id,
      :date => (Time.now - 3.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_9.user_id,
      :job_id => relationship_9.job_id
    )

    relationship_9.start_interview
    Record.write_record(relationship_9) if relationship_9.save

    relationship_9.post_interview
    Record.write_record(relationship_9) if relationship_9.save

    relationship_9.receives_offer
    Record.write_record(relationship_9) if relationship_9.save

    relationship_9.accepts_offer
    Record.write_record(relationship_9) if relationship_9.save

    # Setup relationship with user 6, like job 1 and add an interview in 5 days at 9am

    relationship_10 = Relationship.create(:user_id => user_6.id, :job_id => job_1.id, :company_id => job_1.company_id)
    relationship_10.like_company
    Record.write_record(relationship_10) if relationship_10.save

    interview_10 = Interview.create(
      :relationship_id => relationship_10.id,
      :date => (Time.now + 5.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_10.user_id,
      :job_id => relationship_10.job_id
    )

    relationship_10.start_interview
    Record.write_record(relationship_10) if relationship_10.save

    # Setup relationship with user 6, like job 2 and add an interview in 7 days at 9am

    relationship_11 = Relationship.create(:user_id => user_6.id, :job_id => job_2.id, :company_id => job_2.company_id)
    relationship_11.like_company
    Record.write_record(relationship_11) if relationship_11.save

    interview_11 = Interview.create(
      :relationship_id => relationship_11.id,
      :date => (Time.now + 7.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_11.user_id,
      :job_id => relationship_11.job_id
    )

    relationship_11.start_interview
    Record.write_record(relationship_11) if relationship_11.save

    # Setup relationship with user 6, like job 3 and add an interview in 9 days at 9am

    relationship_12 = Relationship.create(:user_id => user_6.id, :job_id => job_3.id, :company_id => job_3.company_id)
    relationship_12.like_company
    Record.write_record(relationship_12) if relationship_12.save

    interview_12 = Interview.create(
      :relationship_id => relationship_12.id,
      :date => (Time.now + 9.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_12.user_id,
      :job_id => relationship_12.job_id
    )

    relationship_12.start_interview
    Record.write_record(relationship_12) if relationship_12.save

    # Setup relationship with user 1, like job 7 and add an interview in 7 days at 9am

    relationship_13 = Relationship.create(:user_id => user_1.id, :job_id => job_7.id, :company_id => job_7.company_id)
    relationship_13.like_company
    Record.write_record(relationship_13) if relationship_13.save

    interview_13 = Interview.create(
      :relationship_id => relationship_13.id,
      :date => (Time.now + 7.day).to_date,
      :start_time => DateTime.new(2001,2,3,9,0,0),
      :end_time => DateTime.new(2001,2,3,10,0,0),
      :user_id => relationship_13.user_id,
      :job_id => relationship_13.job_id
    )

    relationship_13.start_interview
    Record.write_record(relationship_13) if relationship_13.save

    # Setup relationship for user 1, like job 8

    relationship_14 = Relationship.create(:user_id => user_1.id, :job_id => job_8.id, :company_id => job_8.company_id)
    relationship_14.like_company
    Record.write_record(relationship_14) if relationship_14.save













    puts "\nDone - the demo is now seeded with an example student, an example admin, and example jobs.\n\n"

  end
end
