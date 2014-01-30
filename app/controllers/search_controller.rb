class SearchController < ApplicationController
  before_filter :check_if_logged_in
  def index
    page_count = 30
    if (params[:format] == "xls")
      page_count = Employee.count
    end
    @employees = Employee.search(params, page_count)
    respond_to do |format|
      format.html
      format.json { render json: @employees }
      format.xls
    end
  end
end
