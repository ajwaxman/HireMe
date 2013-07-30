# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  website    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  logo_url   :string(255)
#

class Company < ActiveRecord::Base
  attr_accessible :name, :website, :logo_url

  has_many :relationships
  
  has_many :jobs, 			:dependent => :destroy

  has_many :interviews, :through => :relationships
  has_many :records, 		:through => :relationships
  has_many :users, 			:through => :relationships

end
