module UsersHelper

  # Employment Statistics

  def students_employed
    (Relationship.where(:aasm_state => 'offer_accepted').count / User.where(:role => 'student').count.to_f) * 100
  end

  def students_receiving_offers

  # Interviewing Statistics

  def total_students
    User.where(:role => 'student').count
  end

  def total_students_interviewing
    @users.count{|u| u.student? && u.interviews.any? }
  end

  def percentage_not_interviewing
    ((total_students - total_students_interviewing) / total_students.to_f * 100)
  end

  def percentage_interviewing
    100.5 - percentage_not_interviewing
  end
  
end
