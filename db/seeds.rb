# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# ## rails console -s (test individual commands in sandbox mode)

#     user_1 = User.create(
#       :email => "jack.altman@flatironschool.com",
#       :name => "Jack Altman",
#       :phone => "314-497-4264",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_2 = User.create(
#       :email => "alex.au@flatironschool.com",
#       :name => "Alex Au",
#       :phone => "832-618-5782",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_3 = User.create(
#       :email => "steven.brooks@flatironschool.com",
#       :name => "Steven Brooks",
#       :phone => "201-693-2137",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_4 = User.create(
#       :email => "jennifer.campbell@flatironschool.com",
#       :name => "Jennifer Campbell",
#       :phone => "617-939-1395",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_5 = User.create(
#       :email => "alisa.chang@flatironschool.com",
#       :name => "Alisa Chang",
#       :phone => "845-629-1437",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_6 = User.create(
#       :email => "joshua.collins@flatironschool.com",
#       :name => "Joshua Collins",
#       :phone => "651-260-6075",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_7 = User.create(
#       :email => "micah.corn@flatironschool.com",
#       :name => "Micah Corn",
#       :phone => "718-428-5884",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_8 = User.create(
#       :email => "kristen.curtis@flatironschool.com",
#       :name => "Kristen Curtis",
#       :phone => "503-537-7883",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_9 = User.create(
#       :email => "thomas.deatherage@flatironschool.com",
#       :name => "Thomas Deatherage",
#       :phone => "540-845-8682",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_10 = User.create(
#       :email => "sarah.duve@flatironschool.com",
#       :name => "Sarah Duve",
#       :phone => "330-703-6872",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_11 = User.create(
#       :email => "jennifer.eisenberg@flatironschool.com",
#       :name => "Jennifer Eisenberg",
#       :phone => "908-472-3113",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_12 = User.create(
#       :email => "daniel.friedman@flatironschool.com",
#       :name => "Daniel Friedman",
#       :phone => "610-506-5381",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_13 = User.create(
#       :email => "joe.giralt@flatironschool.com",
#       :name => "Joseph Giralt",
#       :phone => "347-432-3385",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_14 = User.create(
#       :email => "chris.gonzales@flatironschool.company",
#       :name => "Chris Gonzales",
#       :phone => "858-442-9014",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_15 = User.create(
#       :email => "katie.ishibashi@flatironschool.com",
#       :name => "Katie Ishibashi",
#       :phone => "518-534-4002",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_16 = User.create(
#       :email => "maxwell.jacobson@gmail.com",
#       :name => "Max Jacobson",
#       :phone => "914-417-1895",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_17 = User.create(
#       :email => "mendel.kramer@flatironschool.com",
#       :name => "Mendel Kramer",
#       :phone => "213-400-4097",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_18 = User.create(
#       :email => "chris.lake@flatironschool.com",
#       :name => "Chris Lake",
#       :phone => "646-206-5929",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_19 = User.create(
#       :email => "carlos.lazo@flatironschool.com",
#       :name => "Carlos Lazo",
#       :phone => "973-978-5064",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_20 = User.create(
#       :email => "george.lin@flatironschool.com",
#       :name => "George Lin",
#       :phone => "908-392-3650",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_21 = User.create(
#       :email => "david.manaster@flatironschool.com",
#       :name => "David Manaster",
#       :phone => "718-344-2174",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_22 = User.create(
#       :email => "kirin.masood@flatironschool.com",
#       :name => "Kirin Masood",
#       :phone => "609-575-4728",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_23 = User.create(
#       :email => "ruthie.nachmany@flatironschool.com",
#       :name => "Ruthie Nachmany",
#       :phone => "646-339-1031",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_24 = User.create(
#       :email => "samantha.radocchia@flatironschool.com",
#       :name => "Samantha Radocchia",
#       :phone => "860-966-4332",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_25 = User.create(
#       :email => "desmond.rawls@flatironschool.com",
#       :name => "Desmond Rawls",
#       :phone => "206-972-5447",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     user_26 = User.create(
#       :email => "david.rodriguez@flatironschool.com",
#       :name => "David Rodriguez",
#       :phone => "305-790-3447",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_27 = User.create(
#       :email => "matthew.schmaus@flatironschool.com",
#       :name => "Matthew Schmaus",
#       :phone => "201-328-2212",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_28 = User.create(
#       :email => "sagar.shah@flatironschool.com",
#       :name => "Sagar Shah",
#       :phone => "617-640-7951",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_29 = User.create(
#       :email => "jordan.trevino@flatironschool.com",
#       :name => "Jordan Trevino",
#       :phone => "617-671-5993",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_30 = User.create(
#       :email => "anisha.vasandani@flatironschool.com",
#       :name => "Anisha Vasandani",
#       :phone => "626-802-0840",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_31 = User.create(
#       :email => "adam.waxman@flatironschool.com",
#       :name => "Adam Waxman",
#       :phone => "216-533-1493",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     user_32 = User.create(
#       :email => "ning.yap@flatironschool.com",
#       :name => "Ning Yap",
#       :phone => "646-470-5859",
#       :role => "student",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )   

#     admin_1 = User.create(
#       :email => "kelly@flatironschool.com",
#       :name => "Kelly Allen",
#       :phone => "305-609-3053",
#       :role => "admin",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     admin_2 = User.create(
#       :email => "adam@flatironschool.com",
#       :name => "Adam Enbar",
#       :phone => "516-250-8686",
#       :role => "admin",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     admin_3 = User.create(
#       :email => "avi@flatironschool.com",
#       :name => "Avi Flombaum",
#       :phone => "917-753-3666",
#       :role => "admin",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )

#     admin_4 = User.create(
#       :email => "rebekah@flatironschool.com",
#       :name => "Rebekah Rombom",
#       :phone => "516-978-2570",
#       :role => "admin",
#       :hireable => true, 
#       :password => 'acdc', 
#       :password_confirmation => 'acdc'
#     )    

#     ## event table

#     event_1 = Event.create(
#       :description => "Job has been liked.",
#       :state => "like"
#     )

#     event_2 = Event.create(
#       :description => "Job has been unliked.",
#       :state       => "start"
#     )

#     event_3 = Event.create(
#       :description => "Interview scheduled.",
#       :state => "interviewing"
#     )

#     event_4 = Event.create(
#       :description => "Interview is pending resolution.",
#       :state => "pending"
#     )

#     event_5 = Event.create(
#       :description => "User has received offer from company.",
#       :state => "offer_received"
#     )

#     # End States for State Machine

#     event_6 = Event.create(
#       :description => "User has discontinued relationship with company.",
#       :state => "user_decline"
#     )

#     event_7 = Event.create(
#       :description => "Company has passed (for now).",
#       :state => "company_decline"
#     )

#     event_8 = Event.create(
#       :description => "User has accepted job offer from company.",
#       :state => "offer_accepted"
#     )

#     event_9 = Event.create(
#       :description => "User has declined job offer from company.",
#       :state => "offer_declined"
#     )


#     puts "\nDone - database should now be seeded with User | Company | Job | Event | Interview | Relationship | Record data.\n\n"