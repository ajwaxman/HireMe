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

  # Check to see if Relationship exists 
  # If the relationship exists, find the relationship
  # If not, allow for a button to create a relationship
  # Given the button pressed and current state, change the state appropriately

  #################
  ## Constraints ##
  #################
  # => On the job page, no relationship initially exists
  # => params[:id] is different on the jobs page and the interview page

  def find_relationship
    @u_id = current_user.id
    @j_id = params[:job_id] if params.keys.include?("job_id")
    @c_id = Job.find(@j_id).company_id if @j_id
    @r_id = params[:relationship_id] if params.keys.include?("relationship_id")
    Relationship.find_by_user_id_and_job_id_and_company_id(@u_id, @j_id, @c_id)
  end

  def relationship_exist?
    find_relationship.present?
  end

  def create_relationship_and_like
    r = Relationship.create(:user_id => @u_id, :job_id => @j_id, :company_id => @c_id)
    r.link_company
    r.save
  end

  def change_state
    r = find_relationship
    r.send(params["event"])
    r.save 
  end

  def state_action
    if relationship_exist?
      change_state
    else
      create_relationship_and_like
    end
      puts "The end"
      redirect_to job_path(Job.find(params[:job_id]))
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