class Jobs::InterviewsController < ApplicationController
  before_filter :logged_in_only?, :only => [:new, :create]

  # GET 	=> /jobs/:job_id/interviews/new/
  def new
    @interview = Interview.new
    @job 			 = Job.find(params[:job_id])
    @users 		 = User.all

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

end