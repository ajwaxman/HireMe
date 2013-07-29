class StatesController < ApplicationController
  

  def like_company
    @job = Job.find(params[:id])
    @user = current_user
    @relationship = Relationship.find_or_create_by_user_id_and_job_id_and_company_id(	
    											:user_id => @user.id, 
    											:job_id => @job.id, 
    											:company_id => @job.company_id)
    @relationship.aasm_state = "like"
    @relationship.save if @relationship
    redirect_to job_path(@job), :flash => { :success => "You've liked the #{@job.title} position at #{@job.company.name}."}
  end

   def unlike_company
    @job = Job.find(params[:id])
    @user = current_user
    @relationship = Relationship.find_by_user_id_and_job_id_and_company_id(@user.id, @job.id, @job.company_id)
    @relationship.aasm_state = "start"
    @relationship.save if @relationship
    redirect_to job_path(@job), :flash => { :notice => "You've unliked the #{@job.title} position at #{@job.company.name}."}
  end

end