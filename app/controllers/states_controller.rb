class StatesController < ApplicationController
  
  # Check to see if Relationship exists 
  # If the relationship exists, find the relationship
  # If not, allow for a button to create a relationship
  # Given the button pressed and current state, change the state appropriately

  # -- Constraints -- #
  
  # => On the job page, no relationship initially exists
  # => params[:id] is different on the jobs page and the interview page

  def state_action
    if relationship_exist?
      change_state
    else
      create_relationship_and_like
    end
    state_action_redirect
  end

  def admin_like
    if relationship_exist?
      if find_relationship_as_admin_from_jobs.aasm_state == "start"
        change_state
        redirect_to(job_path(Job.find(@j_id)), :flash => { :success => "Job liked for this student." })
      else
        redirect_to(job_path(Job.find(@j_id)), :flash => { :warning => "Student already has a relationship with this job." })
      end
    else
      create_relationship_and_like
      redirect_to(job_path(Job.find(@j_id)), :flash => { :success => "Job liked for this student." })
    end
  end

  def relationship_exist?
    find_relationship.present?
  end

  def find_relationship
    # Check to see which controller we're coming from 
    if params[:controller_name] == "jobs" && current_user.admin?
      find_relationship_as_admin_from_jobs
    elsif params[:controller_name] == "jobs"
      find_relationship_from_jobs
    elsif params[:controller_name] == "interviews"
      find_relationship_from_interviews
    end
  end

  def find_relationship_as_admin_from_jobs
    @u_id = params[:user][:id]
    @j_id = params[:id]
    @c_id = Job.find(@j_id).company_id if @j_id
    Relationship.find_by_user_id_and_job_id_and_company_id(@u_id, @j_id, @c_id)
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