
class PassportsDatatable
  delegate :params,:link_to,:show_passport_path,:edit_passport_path,:remove_passport_path, "DT_RowClass",:h, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Passport.new.class.count,
        iTotalDisplayRecords: passports.total_entries,
        aaData: data
    }
    #binding.pry
  end

  private

  def data
    array=Array.new
    passports.each do |passport|
      array<<{
          "0" => h(passport.employee_number),
          "1" => h(passport.employee.name),
          "2" => h(passport.citizenship),
          "3" => h(passport.number),
          "4" => h(passport.expiry_date),
          "5" => link_to('Show',show_passport_path(passport)),
          "6" => link_to('Edit',edit_passport_path(passport)),
          "7" => link_to("Delete",remove_passport_path(passport), method: :put, data: { confirm: 'Are you sure?' }),
          "DT_RowClass" => "#{h(return_color(passport))}"
      }
    end
    array
  end

  def return_color(passport)
    if passport.isExpired?
      return "danger"
    elsif passport.isDeleted?
      return "danger"
    else
      return "success"
    end
  end

  def passports
    @passports ||= fetch_passports
  end

  def fetch_passports
    passports = Passport.order("#{sort_column} #{sort_direction}")
    passports = passports.page(page).per_page(per_page)
    if params[:sSearch].present?
      passports = passports.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    passports
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[employee_number]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end