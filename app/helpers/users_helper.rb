module UsersHelper

  # Interviewing Statistics

  def total_students
    @users.count{|u| u.role = "student"}
  end

  def total_students_interviewing
    @users.count{|u| u.interviews.any?}
  end

  def percentage_not_interviewing
    ((total_students - total_students_interviewing) / total_students.to_f * 100)
  end

  def percentage_interviewing
    100.5 - percentage_not_interviewing
  end

  
end
