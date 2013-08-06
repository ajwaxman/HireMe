require 'crunchbase'
require 'pry'

class CompanyScraper
  Crunchbase::API.key = '4c663fqra6dx82549gxtcd5r'

  def initialize(company_name)
    begin
      @company_name = company_name
      @valid = true
      @cb_company_hash = Crunchbase::Company.get(company_name)
    rescue Crunchbase::CrunchException
      @valid = false 
    rescue URI::InvalidURIError
      @valid = false 
    rescue Yajl::ParseError
      @valid = false 
    end
  end

  def create_company
    @valid ? add_company_from_crunchbase : add_company_from_scratch
  end

  def add_company_from_crunchbase
    Company.create(
      :name => @cb_company_hash.name,
      :website => (@cb_company_hash.homepage_url ? @cb_company_hash.homepage_url : "Please update"),
      :logo_url => (@cb_company_hash.image["available_sizes"][0][1] ? "http://www.crunchbase.com/#{@cb_company_hash.image["available_sizes"][0][1]}" : "http://farm1.staticflickr.com/72/173447991_3bf67f3f92.jpg"), 
      :crunchbase_url => (@cb_company_hash.crunchbase_url ? @cb_company_hash.crunchbase_url : "Please update"),
      :blog_url => (@cb_company_hash.blog_url ? @cb_company_hash.blog_url : "Please update"),
      :twitter_username => (@cb_company_hash.twitter_username ? @cb_company_hash.twitter_username : "Please update"),
      :number_of_employees => (@cb_company_hash.number_of_employees ? @cb_company_hash.number_of_employees : "Please update"),
      :founded_year => (@cb_company_hash.founded ? @cb_company_hash.founded.year : "Please update" ),
      :overview => @cb_company_hash.overview
    )   
  end

  def add_company_from_scratch
    @company_name.gsub!('-',' ')
    Company.create(
      :name => @company_name,
      :website => "Please update",
      :logo_url => 'computer.jpg',
      :crunchbase_url => "Please update",
      :blog_url => "Please update",
      :twitter_username => "Please update",
      :number_of_employees => "Please update",
      :founded_year => "Please update",
      :overview => "Please add a company overview."
    )   
  end
end