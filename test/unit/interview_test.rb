# == Schema Information
#
# Table name: interviews
#
#  id              :integer          not null, primary key
#  start_time      :datetime
#  end_time        :datetime
#  relationship_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
