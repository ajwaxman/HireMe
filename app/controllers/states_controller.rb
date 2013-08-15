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

  def state_action
    if relationship_exist?
      change_state
    else
      create_relationship_and_like
    end
      puts "The end"
      state_action_redirect
  end

  def relationship_exist?
    find_relationship.present?
  end

  def find_relationship
    # check to see which controller we're coming from 
    if params[:controller_name] == "jobs"
      find_relationship_from_jobs
    elsif params[:controller_name] == "interviews"
      find_relationship_from_interviews
    end
  end

  def find_relationship_from_jobs
    @u_id = current_user.id
    @j_id = params[:job_id]
    @c_id = Job.find(@j_id).company_id if @j_id
    @r_id = params[:relationship_id] if params.keys.include?("relationship_id")
    Relationship.find_by_user_id_and_job_id_and_company_id(@u_id, @j_id, @c_id)  
  end

  def find_relationship_from_interviews
    i = Interview.find(params[:id])
    i.relationship
  end

  def change_state
    r = find_relationship
    r.send(params["event"])
    Record.write_record(r) if r.save
  end

  def create_relationship_and_like
    r = Relationship.create(:user_id => @u_id, :job_id => @j_id, :company_id => @c_id)
    r.like_company
    Record.write_record(r) if r.save
  end

  def state_action_redirect
    if params[:controller_name] == "jobs"
      redirect_to job_path(Job.find(params[:job_id]))
    elsif params[:controller_name] == "interviews"
      redirect_to interview_path(Interview.find(params[:id]))
    end
  end

end