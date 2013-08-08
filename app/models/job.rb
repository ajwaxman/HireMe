# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  attr_accessible :company_id, :description, :title

  belongs_to :company

  has_many :relationships
  has_many :interviews
  
  has_many :records, 		:through => :relationships
  has_many :users, 			:through => :relationships

  searchable do
    text :title
  end

  def relationship_for_user(user)
    @relationship_for_user ||= relationships.detect{|r| r.user_id == user.id}
  end
  
end