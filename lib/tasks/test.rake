namespace :pick do
  desc "Seed our production DB."
  task :questionable do

  job_99 = ChromeJobAdder.new("http://jobs.37signals.com/jobs/13303")
  job_99.create_job_from_link
  end
end