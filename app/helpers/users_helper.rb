module UsersHelper

  def total_students
  	counter = 0
  	@users.each {|u| counter += 1 if u.role = "student"}
  	counter.to_f
  end

  def total_students_interviewing
  	counter = 0
  	@users.each {|u| counter += 1 unless u.interviews.empty?}
  	counter.to_f
  end

  def percentage_not_interviewing
    not_interviewing = ((total_students - total_students_interviewing) / total_students * 100)
    not_interviewing
  end

  def percentage_interviewing
    100 - percentage_not_interviewing
  end



# new_old
    # start_date = DateTime.now - 14
    # end_date = DateTime.now + 21
    # array = Array.new
    # axis_array = Array.new
    # (start_date..end_date).step(1).each_with_index do |date, index| 
    #   interview_count = 0
    #   (date.strftime("%Y-%m-%d")..(date+1).strftime("%Y-%m-%d")).each do |date|
    #     interview_count += Interview.where(:date => date).count 
    #   end
    #   array << [index, interview_count]
    #   axis_array << [index, date.strftime("%Y-%m-%d")]
    # end
    # gon.chart_data = array
    # gon.axis_data = axis_array

# new_incomplete

  
end
