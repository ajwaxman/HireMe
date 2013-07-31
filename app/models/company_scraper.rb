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
    end
  end

  def create_company
    @valid ? add_company_from_crunchbase : add_company_from_scratch
  end

  def add_company_from_crunchbase
    Company.create(
      :name => @cb_company_hash.name,
      :website => @cb_company_hash.homepage_url,
      :logo_url => "http://www.crunchbase.com/#{@cb_company_hash.image["available_sizes"][0][1]}",
      :crunchbase_url => @cb_company_hash.crunchbase_url,
      :blog_url => @cb_company_hash.blog_url,
      :twitter_username => @cb_company_hash.twitter_username,
      :number_of_employees => @cb_company_hash.number_of_employees,
      :founded_year => @cb_company_hash.founded.year,
      :overview => @cb_company_hash.overview
    )   
  end

  def add_company_from_scratch
    Company.create(
      :name => @company_name,
      :website => "http://flatironschool.com",
      :logo_url => "http://mitchwainer.com/digitalocean/flatiron-school-logo.png",
      :crunchbase_url => "http://crunchbase.com",
      :blog_url => "http://blog.flatironschool.com",
      :twitter_username => "flatironschool",
      :number_of_employees => 0,
      :founded_year => 1900,
      :overview => "Please add a company overview."
    )   
  end
end