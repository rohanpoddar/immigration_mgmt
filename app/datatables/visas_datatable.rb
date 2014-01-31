class VisasDatatable < BaseDatatable
  delegate :params, :link_to, :show_visa_path, :edit_visa_path, :remove_visa_path, "DT_RowClass", :h, to: :@view

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
          "0" => link_to('Show', show_visa_path(visa), {:class => "show_link"}),
          "1" => visa.passport.employee_number,
          "2" => visa.passport.number,
          "3" => h(visa.visa_type_name),
          "4" => h(visa.status),
          "5" => h(visa.issue_date),
          "6" => h(visa.expiry_date),
          "7" => link_to('Edit', edit_visa_path(visa, :employee_number => visa.passport.employee_number)),
          "8" => link_to('Remove', remove_visa_path(visa), method: :put, data: {confirm: 'Are you sure?'}),
          "DT_RowClass" => "#{h(return_color(visa))}"
      }
    end
    array
  end

  def return_color(visa)
    if visa.expiry_date==nil||visa.issue_date==nil
      return "warning"
    elsif visa.isExpired? || visa.isDeleted?
      return "danger"
    end
      return "success"
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

  def sort_column
    columns = %w[Show EN PN visa_type_name status issue_date expiry_date edit remove]
    columns[params[:iSortCol_0].to_i]
  end

end