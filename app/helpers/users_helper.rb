module UsersHelper


  def random_avatar
    octocats = ["http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/daftpunktocat-thomas.gif",
                "http://octodex.github.com/images/nyantocat.gif"
              ]
    num = octocats.length
    octocats[rand(num)]
  end

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
    records = Record.all
    records.select {|record| record.event_id == 1}.count
  end

  def offers_made
    records = Record.all
    records.select {|record| record.event_id == 5}.count
  end

  def offers_accepted
    records = Record.all
    records.select {|record| record.event_id == 8}.count
  end

  def offers_rejected
    records = Record.all
    records.select {|record| record.event_id == 9}.count
  end

  # Company Methods

  def hotlist_jobs(user)
    decline_states = ["start", "user_decline", "company_decline", "offer_declined"]
    user.relationships.reject {|rel| decline_states.include?(rel.aasm_state)}    
  end

  def active_jobs(user)
    accept_states = ["interviewing", "pending", "offer_received"]
    user.relationships.select {|rel| accept_states.include?(rel.aasm_state)}    
  end

end