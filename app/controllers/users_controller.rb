class UsersController < ApplicationController

  before_filter :admin_only?, :only => [:index, :dashboard]
  before_filter :current_user_only?, :only => [:edit, :show, :delete]
  # load_and_authorize_resource

  def dashboard
    @interviews = Interview.all
    @users = User.all

    # Calendar view data
    json_interviews = []
    @users.each do |user| 
      user.interviews.each do |interview|
        i = {
          :title => "#{interview.company.name} interview",
          :start => interview.merge_datetime,
          :url => interview_path(interview),
          :allDay => false
        }
        json_interviews << i
      end
    end
    gon.interview = json_interviews
        
    # # Interviews by Week chart data
    # weeks_back = 3
    # weeks_forward = 4
    # days_in_week = 7
    # start_date = DateTime.now.beginning_of_week(:sunday) - (weeks_back * days_in_week)
    # end_date = start_date + ((weeks_back + weeks_forward) * days_in_week)
    # array = Array.new
    # axis_array = Array.new
    # (start_date..end_date).step(7).each_with_index do |date, index| 
    #   interview_count = 0
    #   (date.strftime("%Y-%m-%d")..(date+7).strftime("%Y-%m-%d")).each do |date|
    #     interview_count += Interview.where(:date => date).count 
    #   end
    #   array << [index, interview_count]
    #   axis_array << [index, date.strftime("%Y-%m-%d")]
    # end
    # gon.chart_data = array
    # gon.axis_data = axis_array


    # start_date = DateTime.now - 6
    # end_date = DateTime.now + 12
    # array = Array.new
    # axis_array = Array.new
    # (start_date..end_date).step(2).each_with_index do |date, index| 
    #   interview_count = 0
    #   (date.strftime("%Y-%m-%d")..(date+2).strftime("%Y-%m-%d")).each do |date|
    #     interview_count += Interview.where(:date => date).count 
    #   end
    #   array << [index, interview_count]
    #   axis_array << [index, date.strftime("%b-%d")]
    # end
    def interviews_past
      DateTime.now - 6
    end

    def interviews_future
      DateTime.now + 12
    end

    def interviews_chart
      array = Array.new
          (interviews_past..interviews_future).step(1).each_with_index do |date, index| 
          interview_count = 0
          (date.strftime("%Y-%m-%d")..(date+1).strftime("%Y-%m-%d")).each do |date|
            interview_count += Interview.where(:date => date).count 
          end
            array << [index, interview_count]
        end
      array
    end

    def interviews_chart_dates
      axis_array = Array.new
      (interviews_past..interviews_future).step(1).each_with_index do |date, index| 
        interview_count = 0
        (date.strftime("%Y-%m-%d")..(date+1).strftime("%Y-%m-%d")).each do |date|
          interview_count += Interview.where(:date => date).count 
        end
        axis_array << [index, date.strftime("%b-%d")]
      end
      axis_array
    end

    gon.chart_data = interviews_chart
    gon.axis_data = interviews_chart_dates

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

    @interviews = @user.interviews
    json_interviews = []
    @interviews.each do |interview|
      i = {
        :title => "#{interview.company.name} interview",
        :start => interview.merge_datetime,
        :url => interview_path(interview),
        :allDay => false
      }
      json_interviews << i
    end
    gon.interview = json_interviews

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

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for signing up!"
    else
      render "new"
    end
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
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
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
