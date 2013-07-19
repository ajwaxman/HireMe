class InterviewsController < ApplicationController
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
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(params[:interview])
    user_id = params[:user_id]
    @user = User.find(user_id)
    job_id = params[:job_id]
    company_id = Job.find(job_id).company_id
    @relationship = Relationship.find_or_create_by_user_id_and_job_id_and_company_id(user_id, job_id, company_id)
    @interview.relationship_id = @relationship.id
    @relationship.interview = @interview
    Record.create(:event => "#{@relationship.user.name} has an interview scheduled at #{@relationship.company.name} for the #{@relationship.job.title} position. It starts on #{@relationship.interview.start_time.strftime("%B %d at %I:%M %p")}", :relationship_id => @relationship.id, :company => @relationship.company.name, :job => @relationship.job.title, :user => @relationship.user.name)
    @relationship.start_interview

    respond_to do |format|
      if @relationship.save && @interview.save
        format.html { redirect_to @user, notice: 'Interview was successfully created.' }
        format.json { render json: @interview, status: :created, location: @interview }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
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
      format.html { redirect_to interviews_url }
      format.json { head :no_content }
    end
  end
end
