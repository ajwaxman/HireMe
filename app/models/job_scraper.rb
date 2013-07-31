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
			return SignalsScraper.new(url) 
		when "www.indeed.com"
			return IndeedScraper.new(url)
		when "jobs.github.com"
			return GithubScraper.new(url)
		when "coderwall.com"
			return CoderWallScraper.new(url)
		when "teamtreehouse.com"
			return TeamTreehouseScraper.new(url)
		when "toprubyjobs.com"
			return TopRubyScraper.new(url)
		else
			puts "Domain not supported."
		end

	end

	# Add created job into database.
	def self.add_job_to_db
	end

end

class SignalsScraper < JobScraper

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

class IndeedScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css(".jobtitle").text
		@company_name = @doc.css(".company").text
		@location 		= @doc.css(".location").text
		@description 	= @doc.css(".snip .summary").text
	end

end

class GithubScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css(".inner h1").text
		@company_name = @doc.css(".inner h2").first.text.strip.split("\n").last.strip
		@location 		= @doc.css(".supertitle").text.split("/").last.strip
		@description 	= @doc.css(".main p").first.text
	end

end


class CoderWallScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css("h1.job-title").text
		@company_name = @doc.css(".opportunities h3").text.split(' ')[-2..-1].join(' ')
		@location 		= @doc.css("ul.locations.cf li").text
		@description 	= @doc.css("p.job-text").text
	end

end

class TeamTreehouseScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape

		full_header 	 = @doc.css(".job-headline h1").text
	  company_header = @doc.css(".job-headline h1 strong").text

		@job_title 		= full_header.gsub!(company_header, "").strip
		@company_name = company_header.gsub!("at ","").strip
		@location 		= @doc.css(".job-location").text.strip
		@description 	= @doc.css("#job-details p").first.text		
	end

end

class TopRubyScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css("#col-left h2")
		@company_name = @doc.css("#col-left dd")[0].text
		@location 		= @doc.css("#col-left dd")[1].text
		@description 	= @doc.css(".description").text
	end

end

#############
# TestBench #
#############

signals_job   		= JobScraper.determine_scraper("http://jobs.37signals.com/jobs/13250")
signals_job.scrape

indeed_job 	  		= JobScraper.determine_scraper("http://www.indeed.com/viewjob?jk=7085a9d9a3b0910e&q=ruby&l=New+York%2C+NY&tk=180qkhigv0mp12rd&from=web")
indeed_job.scrape

github_job 	  		= JobScraper.determine_scraper("https://jobs.github.com/positions/0a9333c4-71da-11e0-9ac7-692793c00b45")
github_job.scrape

coderwall_job 		= JobScraper.determine_scraper("https://coderwall.com/team/lithium-technologies/Lead-Java-Engineer-CDE-5csdkq")
coderwall_job.scrape

teamtreehouse_job = JobScraper.determine_scraper("https://teamtreehouse.com/jobs/at-lightspeed-463f105c-7905-4547-a7a2-23bd672bda59")
teamtreehouse_job.scrape

topruby_job 			= JobScraper.determine_scraper("https://toprubyjobs.com/jobs/600-housetrip-ruby-developers")
topruby_job.scrape

binding.pry