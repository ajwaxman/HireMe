Time.zone = "US/Eastern"
env :PATH, ENV['PATH']

set :output, nil
set :output, {:error => nil, :standard => nil}

# Development rake tasks.
every 1.minute do
	rake "cron:post_interview", :environment => "development"
end

every :day, :at => Time.zone.parse('12:00 pm').localtime do
	rake "cron:send_interview_reminder", :environment => "development"
end

# Production rake tasks.
every 1.hour do
	rake "cron:post_interview"
end

every :day, :at => Time.zone.parse('12:00 pm').localtime do
	rake "cron:send_interview_reminder"
end

every :day, :at => Time.zone.parse('11:59 pm').localtime do
  rake "cron:send_survey_reminder"
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever