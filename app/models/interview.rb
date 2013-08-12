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
  
  attr_accessible :end_time, :relationship_id, :start_time, :date, :user_id, :job_id

  belongs_to :user
  belongs_to :job
  belongs_to :relationship

  has_one :company, :through => :job
  has_one :comment
  has_many :records,	:through => :relationship

  validates_presence_of   :date,
    :message => " should not be blank."
  validates_presence_of   :start_time,
    :message => " should not be blank."
  validates_presence_of   :end_time,
    :message => " should not be blank."

  validate :validates_start_time_and_end_time,
    :message => "Start time must come before end time."

  def merge_datetime
    date = self.date
    time = self.start_time
    new_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
    new_datetime.strftime("%Y-%m-%d %H:%M:%S")
  end 

  def merge_datetime_object
    date = self.date
    time = self.start_time
    DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
  end 

end
