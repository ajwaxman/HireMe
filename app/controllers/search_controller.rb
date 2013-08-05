class SearchController < ApplicationController
  def index

  	@search = Sunspot.search(User, Company, Job) do
		  fulltext params[:search]
		end
		@searches = @search.results
		raise params.inspect


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end


    end
end
