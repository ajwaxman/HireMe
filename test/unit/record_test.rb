# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  relationship_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user            :string(255)
#  company         :string(255)
#  job             :string(255)
#  event_id        :integer
#

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
