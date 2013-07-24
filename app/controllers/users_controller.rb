class UsersController < ApplicationController

  before_filter :admin_only?, :only => [:index]
  before_filter :current_user_only?, :only => [:edit, :show, :delete]
  # load_and_authorize_resource

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
