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

class Interview < ActiveRecord::Base
  include Validations::StartTime
  
  attr_accessible :end_time, :relationship_id, :start_time, :date

  has_one :relationship

  has_one :company, :through => :relationship
  has_one :job, 		:through => :relationship
  has_one :user,    :through => :relationship

  has_many :records,	:through => :relationship

  validates_presence_of   :date
  validates_presence_of   :start_time
  validates_presence_of   :end_time

  validate :validates_start_time_and_end_time

  def merge_datetime
    date = self.date
    time = self.start_time
    new_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
    date = new_datetime.strftime("%Y-%m-%d %H:%M:%S")
  end 

  def merge_datetime_object
    date = self.date
    time = self.start_time
    new_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
  end 

end
