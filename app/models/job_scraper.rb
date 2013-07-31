# Notes from Avi for refactoring later.

class JobScraper
   def initialize(url)
   	#common routine
   end

	def scrape
		job_title
		job_address
		job_salary
	end

	def job_title
		doc.search(job_title_selector)
	end

 end

class SignalScraper < JobScraper
	def job_title_selector
	 "h2.job_title"
	end

	def job_title
		base_scrape = super
		base_scrape.inner_text.gsub("whatever", "wahtever")
end

class IndeedScraper < JobScraper

	def scrape
	end

end

class RubyNowScraper < JobScraper

	def scrape
	end

end

class TreehouseScraper < JobScraper
	def intialize(url)
	end

		# custom routine
		super(url)
	def scrape
	end

end

case url
when "37Signals"
	klass = SignalScraper
when "Indeed"
	klass = IndeedScraper
when "RubyNow"
	klass = RubyNowScraper
end

klass.new(url).scrape
