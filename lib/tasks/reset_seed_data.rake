Time.zone = "US/Eastern"
require "active_support/core_ext/numeric/time"

# Offset of 4hrs due to EST for 12-36 hour time window.

namespace :cron do
  desc "Send survey reminder if interview occured today"
  task :reset_seed_data => :environment do
    
  end

end