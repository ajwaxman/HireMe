Time.zone = "US/Eastern"
require "active_support/core_ext/numeric/time"

# Offset of 4hrs due to EST for 12-36 hour time window.

namespace :cron do
  desc "Send survey reminder if interview occured today"
  task :send_survey_reminder => :environment do

    Interview.where(:date => Time.zone.now.localtime.to_date).each do |interview|
      UserMailer.survey_reminder(interview).deliver
    end
  end

end