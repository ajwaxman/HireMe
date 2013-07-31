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
#  number_of_employees :integer
#  founded_year        :integer
#  overview            :text
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
