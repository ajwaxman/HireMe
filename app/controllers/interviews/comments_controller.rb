class Interviews::CommentsController < ApplicationController

	def new
		@comment = Comment.new
		@interview = Interview.find(params[:interview_id])
		@user = @interview.user
		@job = @interview.job
		@company = @job.company

	  respond_to do |format|
	    format.html # new.html.erb
	    format.json { render json: @comment }
	  end

	end

	def create
		@comment = Comment.new
		@comment.interview = Interview.find(params[:interview_id])
		@comment.user = current_user
		@comment.questions = "Rails1\nRails2\nRails3"#params[:comment][:questions]
		@comment.notes = params[:comment][:notes]

		int = @comment.interview

    respond_to do |format|
      if @comment.save
        format.html { redirect_to int, notice: 'Comment was successfully created.' }
        format.json { render json: int, status: :created, location: int }
      else
        format.html { render action: "new" }
        format.json { render json: int.errors, status: :unprocessable_entity }
      end
    end

	end

	def update

	end

	def destroy

	end

end