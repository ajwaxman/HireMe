class Jobs::InterviewsController < ApplicationController

  # GET 	=> /jobs/:job_id/interviews/new/
  def new
    @interview = Interview.new
    @job 			 = Job.find(params[:job_id])
    @users 		 = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interview }
    end
  end

  # POST 	=> /jobs/:job_id/interviews/new/
  def create

    c_id, j_id, u_id = Job.find_ids(params[:job_id],params[:user_id])
    int, rel 				 = Job.establish_relationship(params[:interview],c_id, j_id, u_id)
    
    @user = User.find(u_id)	# Find user for redirect.

    respond_to do |format|
      if rel.save && int.save

      	Record.create_record(rel)		# Create Record from relationship.

        format.html { redirect_to @user, notice: 'Interview was successfully created.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render action: "new" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

end