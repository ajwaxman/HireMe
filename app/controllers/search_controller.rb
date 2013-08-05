class SearchController < ApplicationController
  def index

    sunspot_search = Sunspot.search(Job, Company, User) do
      fulltext params[:search] 
      # paginate :per_page => 10
    end

    # raise sunspot_search
    @search_results = sunspot_search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end
end
