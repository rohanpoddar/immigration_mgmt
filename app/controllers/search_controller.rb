class SearchController < ApplicationController
  def index
    @employees = Employee.search(params)
    respond_to do |format|
      format.html
      format.json { render json: @employees }
    end

  end
end
