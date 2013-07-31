require 'nokogiri'
require 'open-uri'

class JobAdder

	# url = "http://jobs.37signals.com/jobs/13232"
	# url = "http://www.indeed.com/viewjob?jk=7085a9d9a3b0910e&q=ruby&l=New+York%2C+NY&tk=180oir3ml0n3118p&from=web"
	# url = "https://jobs.github.com/positions/0a9333c4-71da-11e0-9ac7-692793c00b45"
	# url = "https://coderwall.com/team/lithium-technologies/Full-Stack-Engineer-vglkva"

	uri = URI.parse(url)
	case uri.host
	when "jobs.37signals.com"
		doc = Nokogiri::HTML(open(url))
		job_title = doc.css(".listing-header-container h1").text
		company_name = doc.css(".listing-header-container h2 span.company").text
		location = doc.css(".listing-header-container h2 span.location").text
		description = doc.css(".listing-container").text
	when "www.indeed.com"
		doc = Nokogiri::HTML(open(url))
		job_title = doc.css(".jobtitle").text
		company = doc.css(".company").text
		location = doc.css(".location").text
		description = doc.css(".snip .summary").text
	when "jobs.github.com"
		doc = Nokogiri::HTML(open(url))
		job_title = doc.css(".inner h1").text
	  company = doc.css(".inner h2").first.text.strip.split("\n").last.strip
	  location = doc.css(".supertitle").text.split("/").last.strip
	  description = doc.css(".main p").first.text
	when "coderwall.com"
		doc = Nokogiri::HTML(open("https://coderwall.com/team/lithium-technologies/Full-Stack-Engineer-vglkva"))
		job_title = doc.css("h1.job-title").text
		company = doc.css(".opportunities h3").text.split(' ')[-2..-1].join(' ')
		location = doc.css("ul.locations.cf li").text
		description = doc.css("p.job-text").text
	when "teamtreehouse.com"
		doc = Nokogiri::HTML(open(url))
	  job_title = full_header.gsub!(company_header, "").strip
	  compan_title = company_header.gsub!("at ","").strip
	  location = doc.css(".job-location").text.strip
	  description = doc.css("#job-details p").first.text

	  full_header = doc.css(".job-headline h1").text
	  company_header = doc.css(".job-headline h1 strong").text		
	when "toprubyjobs.com"
		doc = Nokogiri::HTML(open(url))
	  job_title = doc.css("#col-left h2")
	  company_title = doc.css("#col-left dd")[0].text
	  location = doc.css("#col-left dd")[1].text
	  description = doc.css(".description").text
	end
end