# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## rails console -s (test individual commands in sandbox mode)

## seed users table

user_1 = User.create(
  :email => "avi@flatironschool.com",
  :name => "Avi",
  :phone => "867-5309"
)

user_2 = User.create(
  :email => "bob@flatironschool.com",
  :name => "Bob",
  :phone => "555-5555"
)

## seed companies table

company_1 = Company.create(
  :name => "Artsy",
  :website => "http://artsy.net/"
)

company_2 = Company.create(
  :name => "Bondsy",
  :website => "https://www.bondsy.com/"
)

## seed jobs table

job_1 = Job.create(
  :company_id => 1,
  :description => "Job for artsy",
  :title => "Software Developer"
)

job_2 = Job.create(
  :company_id => 1,
  :description => "Second job for artsy",
  :title => "Senior Software Developer"
)

job_3 = Job.create(
  :company_id => 2,
  :description => "Job for bondsy",
  :title => "Rails Developer"
)

## seed relationships table

relationship_1 = Relationship.create(
  :aasm_state => "in_progress",
  :company_id => 1,
  :job_id => 1, 
  :user_id => 1
)

relationship_2 = Relationship.create(
  :aasm_state => "open_status",
  :company_id => 2,
  :job_id => 2, 
  :user_id => 2
)

## seed interviews table

interview_1 = Interview.create(
  :start_time => "2013-07-16 12:57:39 EST",
  :end_time => "2013-07-16 15:57:39 EST",
  :relationship_id => 1
)

interview_2 = Interview.create(
  :start_time => "2013-07-17 5:57:39 EST",
  :end_time => "2013-07-17 13:57:39 EST",
  :relationship_id => 2
)

## seed records table

record_1 = Record.create(
  :relationship_id => 2,
  :event => "Interview scheduled on [SOME DAY HERE]."
)

record_2 = Record.create(
  :relationship_id => 1,
  :event => "Job offer made."
)