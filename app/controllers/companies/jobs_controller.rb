class Companies::JobsController < ApplicationController

  # GET 	=> /companies/:company_id/jobs/new/
  def new
    @job     = Job.new
    @company = Company.find(params[:company_id])
    @users 	 = User.all

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

end