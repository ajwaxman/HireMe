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

  def rel_like_company
    @relationship = Relationship.find(params[:id])
    @job = @relationship.job
    @user = @relationship.user
    @relationship.aasm_state = "like"
    @relationship.save if @relationship
    redirect_to relationship_path(@relationship), :flash => { :success => "You've liked the #{@job.title} position at #{@job.company.name}."}
  end

   def rel_unlike_company
    @relationship = Relationship.find(params[:id])
    @job = @relationship.job
    @user = @relationship.user
    @relationship.aasm_state = "start"
    @relationship.save if @relationship
    redirect_to relationship_path(@relationship), :flash => { :notice => "You've unliked the #{@job.title} position at #{@job.company.name}."}
  end

  def rel_company_declined
    
  end

  def rel_user_declined
    
  end

  def received_offer
    
  end

  def accept_offer
    @relationship = Relationship.find(params[:id])
    @relationship.aasm_state = "offer_accepted"
    @relationship.save if @relationship
    redirect_to relationship_path(@relationship), :flash => { :success => "You were offered and accepted the #{@relationship.job.title} position at #{@relationship.company.name}. Congrats!"}
  end

  def reject_offer
    @relationship = Relationship.find(params[:id])
    @relationship.aasm_state = "offer_declined"
    @relationship.save if @relationship
    redirect_to relationship_path(@relationship), :flash => { :notice => "You declined the #{@relationship.job.title} position at #{@relationship.company.name}. To greener pastures!"}
  end

end