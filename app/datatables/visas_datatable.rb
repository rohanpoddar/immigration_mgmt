
class VisasDatatable
  delegate :params,:link_to,:show_visa_path,:edit_visa_path,:remove_visa_path, "DT_RowClass",:h, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Visa.count,
        iTotalDisplayRecords: visas.total_entries,
        aaData: data
    }
  end

  private

  def data
    array=Array.new
    visas.each do |visa|
      array<<{
          "0" => visa.passport.employee_number,
          "1" => visa.passport.number,
          "2" => visa.visa_type_name,
          "3" => visa.status,
          "4" => link_to('Show',show_visa_path(visa),{:class =>"show_link"}),
          "5" => link_to('Edit',edit_visa_path(visa)),
          "6" => link_to('Remove',remove_visa_path(visa)),
          "DT_RowClass" => "#{h(return_color(visa))}"
      }
    end
    array
  end

  def return_color(visa)
    if visa.isExpired?
      return "danger"
    elsif visa.isDeleted?
      return "danger"
    else
      return "success"
    end
  end

  def visas
    @visas ||= fetch_visas
  end

  def fetch_visas
    visas = Visa.order("#{sort_column} #{sort_direction}")
    visas = visas.page(page).per_page(per_page)
    if params[:sSearch].present?
      visas = visas.where("visa_type_name ilike :search", search: "%#{params[:sSearch]}%")
    end
    visas
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[TABLE COLUMNS HERE]
    columns[params[:iSortCol_0].to_i]
    "visa_type_name"
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end