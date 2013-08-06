class InterviewsController < ApplicationController
  before_filter :admin_only?, :only => [:index]
  before_filter :current_user?, :only => [:new, :create]
  before_filter :current_interview_owner_only?, :only => [:edit, :show, :destroy]
  
  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interviews }
    end
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @interview = Interview.find(params[:id])
    @job       = @interview.job
    @relationship = @interview.relationship
    @state = @relationship.aasm_state if @relationship

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/new
  # GET /interviews/new.json
  def new
    @interview = Interview.new
    @jobs = Job.all
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interview }
    end
  end

  # GET /interviews/1/edit
  def edit
    @interview = Interview.find(params[:id])
    @jobs      = Job.all
    @users     = User.all
  end

  # POST  => /jobs/:job_id/interviews/new/
  # POST  => /jobs/:user_id/interviews/new/
  # POST  => /interviews/new/

  def create
    c_id, j_id, u_id = Relationship.find_ids(params[:job_id],params[:user_id])
    int = Interview.new(params[:interview])
    
    respond_to do |format|
      if int.save
        int, rel = Relationship.establish_relationship(c_id, j_id, u_id, int)
        rel.save
        Record.write_record(rel)
        format.html { redirect_to interview_path(int), notice: 'Interview was successfully created.' }
        format.json { render json: interview_path(int), status: :created, location: @interview }
      else
          @interview = int
          @users = User.all
          @job   = Job.find_by_id(j_id)
          @user  = User.find_by_id(u_id)
          format.html { render "jobs/interviews/new", :controller => "jobs/interviews", notice: 'Interview was not created properly.' }
          format.json { render json: @interview.errors, status: :unprocessable_entity }

      end
    end
  end

  # PUT /interviews/1
  # PUT /interviews/1.json
  def update
    @interview = Interview.find(params[:id])

    respond_to do |format|
      if @interview.update_attributes(params[:interview])
        format.html { redirect_to user_path(current_user), notice: 'Interview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    respond_to do |format|
      format.html { redirect_to (current_user.student? ? user_path(current_user) : interviews_url), notice: 'Interview was successfully deleted!' }
      format.json { head :no_content }
    end
  end
end