# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id :integer
#  job_id     :integer
#  company_id :integer
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date_time  :datetime
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
