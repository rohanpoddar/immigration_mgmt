class BaseDatatable
  def initialize(view)
    @view = view
  end

  private

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
end
