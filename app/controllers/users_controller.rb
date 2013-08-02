class UsersController < ApplicationController

  before_filter :admin_only?, :only => [:index, :dashboard, :new, :create, :destroy]
  before_filter :current_user_only?, :only => [:edit, :show]
  
  helper_method :get_calendar_data
  helper_method :interviews_past
  helper_method :interviews_future
  helper_method :interviews_chart
  helper_method :interviews_chart_dates

  def dashboard
    @interviews = Interview.all
    @users = User.all

    # Calendar view data

    gon.interview  = get_calendar_data(@users)
    gon.chart_data, gon.axis_data = interviews_chart

    # boilerplate rails code
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    # authorize! if can? :manage, @user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    gon.interview  = collect_calendar_data(@user.interviews)
    @relationships = @user.relationships

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.js { render @user}
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  ##################
  # HELPER METHODS #
  ##################

  def interviews_past
    DateTime.now - 6
  end

  def interviews_future
    DateTime.now + 12
  end

  def interviews_chart
    interview_array = []; axis_array = []

    (interviews_past..interviews_future).step(1).each_with_index do |date, index| 
      interview_count = Interview.where(:date => date.strftime("%Y-%m-%d")).count 
      interview_array << [index, interview_count]
      axis_array << [index, date.strftime("%b-%d")]
    end
    
    return interview_array, axis_array
  end

  def get_calendar_data(users)
    json_interviews = []

    @users.each do |user|
      json_interviews << collect_calendar_data(user.interviews) 
    end

    json_interviews.flatten
  end

  def collect_calendar_data(interviews)
    interviews.collect do |interview|
      {
        :title => "#{interview.company.name} interview",
        :start => interview.merge_datetime,
        :url => interview_path(interview),
        :allDay => false
      }
    end
  end

end