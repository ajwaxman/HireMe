require 'open-uri'

class JobScraper

	attr_accessor :job_title, :company_name, :location, :description, :crunchbase_name

	def initialize(url)
		@doc = Nokogiri::HTML(open(url))
		@url = url
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
		when "www.crunchbase.com"
			return CrunchbaseScraper.new(url)
		else
			puts "Domain not supported."
		end

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
		@description 	= @doc.css(".main p").text
	end

end


class CoderWallScraper < JobScraper

	def initialize(url)
		super(url)
	end

	def scrape
		@job_title 		= @doc.css("h1.job-title").text
		@company_name = @doc.css(".team-header h1").text
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

class CrunchbaseScraper < JobScraper


	
	def initialize(url)
		super(url)
	end

	def scrape
		@company_name = @url.split("/").last
		@crunchbase_name = @doc.css("head title").text.split("|").first.strip
	end

end