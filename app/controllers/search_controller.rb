class SearchController < ApplicationController
  def index

  end

  def results
    flash[:notice]="Search Results"
  end
end
