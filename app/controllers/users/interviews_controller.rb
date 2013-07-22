class Users::InterviewsController < ApplicationController

  # GET 	=> /users/:user_id/interviews/new/
  def new
    @interview = Interview.new
    @jobs 		 = Job.all
    @user 		 = User.find(params[:user_id])

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

end