module UsersHelper

  # Employment Statistics

  def students_hireable
    User.where(:role => "student", :hireable => true)
  end

  def number_students_hireable
    students_hireable.count
  end

  def students_employed
    students_hireable.select{|u| u.relationships.where(:aasm_state => "offer_accepted").any? }.count
  end

  def display_employed_students
    (students_employed / number_students_hireable.to_f) * 100
  end

  def students_receiving_offers
  end

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

  def company_likes(user)
    user.relationships.select {|like| like.aasm_state == "like"}    
  end
  
end