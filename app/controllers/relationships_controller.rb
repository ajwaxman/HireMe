class RelationshipsController < ApplicationController
  # GET /relationships
  # GET /relationships.json
  def index
    @relationships = Relationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relationships }
    end
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relationship }
    end
  end

  # PUT /users/:id/relationship/new
  def new
    @relationship = Relationship.new

    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relationship }
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = Relationship.find(params[:id])
  end

  # POST /users/:id/relationship/
  def create    
    @relationship = Relationship.new(params[:relationship])

    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:job_id]
      @job = Job.find(params[:job_id])
    end
    
    respond_to do |format|
      if @relationship.save
        if @user
          format.html { redirect_to @user, notice: 'Relationship was successfully created.' }
          format.json { render json: @user, status: :created, location: @relationship }
        elsif @job
          format.html { redirect_to @job, notice: 'Relationship was successfully created.' }
          format.json { render json: @job, status: :created, location: @relationship }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relationships/1
  # PUT /relationships/1.json
  def update
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      if @relationship.update_attributes(params[:relationship])
        format.html { redirect_to @relationship, notice: 'Relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end
end
