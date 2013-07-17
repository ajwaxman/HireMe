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
  has_many :interviews
  has_many :users, :through => :interviews

end
