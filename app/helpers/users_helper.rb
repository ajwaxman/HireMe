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
    students_hireable.select{|u| u.relationships.where('aasm_state = "offer_received" or aasm_state = "offer_accepted" or aasm_state = "offer_declined"').any? }.count
  end

  def display_students_receiving_offers
    (students_receiving_offers / number_students_hireable.to_f) * 100
  end

  # Interviewing Statistics

  def total_students
    User.where(:role => 'student').count
  end

  def total_students_interviewing
    students_hireable.select{|u| u.student? && u.interviews.any? }.count
  end

  def percentage_not_interviewing
    ((total_students - total_students_interviewing) / total_students.to_f * 100)
  end

  def percentage_interviewing
    100 - percentage_not_interviewing
  end

  def interviews_completed
    Interview.where("date < ?", Date.current).count
  end

 def total_likes
    relationships = Relationship.all 
    relationships.collect {|rel| rel.aasm_state == "like"}.count
  end

  # Company Methods

  def company_likes(user)
    decline_states = ["start", "user_decline", "company_decline", "offer_declined"]
    user.relationships.reject {|like| decline_states.include?(like.aasm_state)}    
  end
  
end