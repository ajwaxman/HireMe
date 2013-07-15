# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## rails console -s (test individual commands in sandbox mode)

## seed students table

student_1 = Student.create(
  :email => "avi@flatironschool.com",
  :name => "Avi",
  :phone => "867-5309"
)

## seed companies table

company_1 = Company.create(
  :name => "Artsy",
  :website => "http://artsy.net/"
)

## seed jobs table

job_1 = Job.create(
  :company_id => 1,
  :description => "Job for artsy",
  :title => "Software Developer"
)

## seed interviews table

interview_1 = Interview.create(
  :company_id => 1,
  :job_id => 1, 
  :student_id => 1
  :status => "none"
)