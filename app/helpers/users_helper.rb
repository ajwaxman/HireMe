module UsersHelper

  def total_students
    @users.select {|u| u.role ="student"}.size.to_f
  end

  def total_students_interviewing
    @users.select {|u| !u.interviews.empty?}.size.to_f
  end

  def percentage_not_interviewing
    ((total_students - total_students_interviewing) / total_students * 100)
  end

  def percentage_interviewing
    100.5 - percentage_not_interviewing
  end
  
end
