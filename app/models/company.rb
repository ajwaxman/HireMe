# == Schema Information
#
# Table name: companies
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  website             :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  logo_url            :string(255)
#  crunchbase_url      :string(255)
#  blog_url            :string(255)
#  twitter_username    :string(255)
#  number_of_employees :string(255)
#  founded_year        :string(255)
#  overview            :text
#

class Company < ActiveRecord::Base
  attr_accessible :name, :website, :logo_url, :crunchbase_url, :blog_url,
                  :twitter_username, :number_of_employees, :founded_year, :overview

  has_many :relationships
  
  has_many :jobs, 			:dependent => :destroy

  has_many :interviews, :through => :relationships
  has_many :records, 		:through => :relationships
  has_many :users, 			:through => :relationships

  validates_presence_of   :logo_url
  validates_presence_of   :name
  validates_presence_of   :website

  searchable do
    text :name
  end


end
