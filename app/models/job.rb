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


  after_initialize :set_relationship_for_users

  searchable do
    text :title
  end

  def relationship_for_user(user)
   @relationship_for_users[user.id] ||= if relationships.loaded?
     relationships.detect{|r| r.user_id == user.id}
   else
     relationships.where(:relationships => {:user_id => user.id}).first
    end
  end
  
  private
    def set_relationship_for_users
      @relationship_for_users ||= {}
    end

end

#<Job