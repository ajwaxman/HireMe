# == Schema Information
#
# Table name: interviews
#
#  id              :integer          not null, primary key
#  relationship_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  date            :date
#  start_time      :time
#  end_time        :time
#

require 'test_helper'

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
