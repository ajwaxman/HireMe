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

    # Setup relationship, like job 1 and add an interview for the next day at 1pm

    relationship_1 = Relationship.create(:user_id => user_1.id, :job_id => job_1.id, :company_id => job_1.company_id)
    relationship_1.like_company
    Record.write_record(relationship_1) if relationship_1.save

    interview_1 = Interview.create(
      :relationship_id => relationship_1.id,
      :date => (Time.now + 1.day).to_date,
      :start_time => DateTime.new(2001,2,3,13,0,0),
      :end_time => DateTime.new(2001,2,3,14,0,0),
      :user_id => relationship_1.user_id,
      :job_id => relationship_1.job_id
    )

    relationship_1.start_interview
    Record.write_record(relationship_1) if relationship_1.save








    puts "\nDone - the demo is now seeded with an example student, an example admin, and example jobs.\n\n"

  end
end
