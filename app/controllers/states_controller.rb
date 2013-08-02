class StatesController < ApplicationController
  
  # Like and Unlike a job as a logged in User.

  def like_company
    job  = Job.find(params[:id])
    user = current_user

    relationship = Relationship.find_or_create_by_user_id_and_job_id_and_company_id(	
    											:user_id => user.id, 
    											:job_id => job.id, 
    											:company_id => job.company_id)
    relationship.aasm_state = "like"

    Record.write_record(relationship) if relationship.save
    
    redirect_to job_path(job), :flash => { :success => "You've liked the #{job.title} position at #{job.company.name}."}
  end

  def unlike_company
    job  = Job.find(params[:id])
    user = current_user
    
    relationship = Relationship.find_by_user_id_and_job_id_and_company_id(user.id, job.id, job.company_id)
    relationship.aasm_state = "start"
    
    Record.write_record(relationship) if relationship.save
    
    redirect_to job_path(job), :flash => { :notice => "You've unliked the #{job.title} position at #{job.company.name}."}
  end

  # Like and Unlike companies from the relationship page.

  def rel_like_company
    relationship = Relationship.find(params[:id])
    job          = relationship.job
    user         = relationship.user
    
    relationship.aasm_state = "like"
    Record.write_record(relationship) if relationship.save

    redirect_to job_path(job), :flash => { :success => "You've liked the #{job.title} position at #{job.company.name}."}
  end

  def rel_unlike_company
    relationship = Relationship.find(params[:id])
    job          = relationship.job
    user         = relationship.user
    
    relationship.aasm_state = "start"
    Record.write_record(relationship) if relationship.save

    redirect_to job_path(job), :flash => { :notice => "You've unliked the #{job.title} position at #{job.company.name}."}
  end

  def rel_company_declined
    user = current_user
    interview = Interview.find(params[:id])
    job = interview.job
    relationship = Relationship.find_by_user_id_and_job_id(user.id,job.id) 
    relationship.aasm_state = "company_decline"
    relationship.save if relationship
    Record.write_record(relationship) if relationship.save
    redirect_to interview_path(interview), :flash => { :notice => "#{relationship.company.name} declined to continue discussions."}
  end

  def rel_user_declined
    user = current_user
    interview = Interview.find(params[:id])
    job = interview.job
    relationship = Relationship.find_by_user_id_and_job_id(user.id,job.id) 
    relationship.aasm_state = "user_decline"
    relationship.save if relationship
    Record.write_record(relationship) if relationship.save
    redirect_to interview_path(interview), :flash => { :notice => "You declined to continue discussing the #{relationship.job.title} position at #{relationship.company.name}."}
  end

  def rel_offer_received
    user = current_user
    interview = Interview.find(params[:id])
    job = interview.job
    relationship = Relationship.find_by_user_id_and_job_id(user.id,job.id) 
    relationship.aasm_state = "offer_received"
    relationship.save if relationship
    Record.write_record(relationship) if relationship.save
    redirect_to interview_path(interview), :flash => { :success => "You received an offer for the #{relationship.job.title} position at #{relationship.company.name}. Congrats!"}
  end

  def accept_offer
    user = current_user
    interview = Interview.find(params[:id])
    job = interview.job
    relationship = Relationship.find_by_user_id_and_job_id(user.id,job.id) 
    relationship.aasm_state = "offer_accepted"
    relationship.save
    Record.write_record(relationship)
    
    redirect_to user_path(user), :flash => { :success => "You were offered and accepted the #{relationship.job.title} position at #{relationship.company.name}. Congrats!"}
  end

  def reject_offer
    user = current_user
    interview = Interview.find(params[:id])
    job = interview.job
    relationship = Relationship.find_by_user_id_and_job_id(user.id,job.id) 
    relationship.aasm_state = "offer_declined"
    relationship.save if relationship
    Record.write_record(relationship) if relationship.save
    redirect_to user_path(user), :flash => { :notice => "You declined the #{relationship.job.title} position at #{relationship.company.name}. To greener pastures!"}
  end

end