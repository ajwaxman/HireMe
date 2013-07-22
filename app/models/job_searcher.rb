require 'indeed'
require 'pp'

class JobSearcher

	IndeedPubID = 7856072779151530

	def self.indeed_search (query,location)
		Indeed.key = IndeedPubID
		result = Indeed.search(:q => query, :l => location)

		result
	end

end