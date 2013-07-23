namespace :db do
  desc "Seed db users with passwords for MVP demo."
  task :mvp_pwd => :environment do

  user_1 = User.find(1)
  user_1.password = "carlos"
	user_1.password_confirmation = "carlos"
	user_1.save

	user_2 = User.find(2)
	user_2.password = "chris"
	user_2.password_confirmation = "chris"
	user_2.save

	user_3 = User.find(3)
	user_3.password = "david"
	user_3.password_confirmation = "david"
	user_3.save

	user_4 = User.find(4)
	user_4.password = "adam"
	user_4.password_confirmation = "adam"
	user_4.save

	user_5 = User.find(5)
	user_5.password = "avi"
	user_5.password_confirmation = "avi"
	user_5.save

	puts "\nRake task completed - users should have pwd for MVP.\n"

  end
end