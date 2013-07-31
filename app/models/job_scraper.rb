require 'nokogiri'
require 'open-uri'
require 'pry'

class JobScraper

	attr_accessor :job_title, :company_name, :location, :description

	def initialize(url)
		@doc = Nokogiri::HTML(open(url))
	end

	#################
	# Class Methods #
	#################

	# Return an initialized JobScraper of the right type.
	def self.determine_scraper(url)

	# Depending on the job site we're on,
	# return *Scraper.new(url) from this method.

		host = URI.parse(url).host

		case host
		when "jobs.37signals.com"
			return SignalScraper.new(url) 
		# when "www.indeed.com"
		# 	return IndeedScraper.new(url)
		# when "jobs.github.com"
		# 	return GithubScraper.new(url)
		# when "coderwall.com"
		# 	return CoderwallScraper.new(url)
		# when "teamtreehouse.com"
		# 	return TeamTreehouseScraper.new(url)
		else
			puts "Domain not supported."
		end

	end

	def scope_test
		puts "Job title = #{@job_title}"
	end

	# Add created job into database.
	def self.add_job_to_db
	end

end

class SignalScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css(".listing-header-container h1").text
		@company_name = @doc.css(".listing-header-container h2 span.company").text
		@location 		= @doc.css(".listing-header-container h2 span.location").text
		@description 	= @doc.css(".listing-container").text
	end

end

#############
# TestBench #
#############

scraper = JobScraper.determine_scraper("http://jobs.37signals.com/jobs/13257")
binding.pry

# scraper = JobScraper.determine_scraper(url).scrape(url)

# signal_scraper = SignalScraper.new("http://jobs.37signals.com/jobs/13257")