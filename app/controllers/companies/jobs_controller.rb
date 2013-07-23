class Companies::JobsController < ApplicationController
	before_filter :logged_in?, :only => [:index, :show, :update, :new]
  # GET 	=> /companies/:company_id/jobs/new/
  def new
    @job     = Job.new
    @company = Company.find(params[:company_id])

    respond_to do |format|
      format.html
      format.json { render json: @interview }
    end
  end

end