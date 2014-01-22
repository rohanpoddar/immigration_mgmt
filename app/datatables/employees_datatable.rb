class EmployeesDatatable
  delegate :params,:link_to,:edit_employee_path,:remove_employee_path, "DT_RowClass",:h, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Employee.count,
        iTotalDisplayRecords: employees.total_entries,
        aaData: data
    }
    #binding.pry
  end

  private

  def data
    array=Array.new
    employees.each do |employee|
     array<< {
         "0" => link_to(employee.number,employee),
         "1" => h(employee.name),
         "2" => h(employee.category),
         "3" => h(employee.joining_date),
         "4" => h(employee.exit_date),
         "5" => h(employee.position),
         "6" => h(employee.location),
         "7" => link_to('Edit',edit_employee_path(employee)),
         "8" => link_to("Delete",remove_employee_path( employee), method: :put, data: { confirm: 'Are you sure?' }),
         "DT_RowClass" => "#{h(return_color(employee))}"
     }
    end
    array
  end

  def return_color(employee)
    if employee.passport==nil
      return "danger"
    elsif employee.passport.isExpired?
      return "danger"
    elsif employee.passport.isDeleted?
      return "danger"
    else
      return "success"
    end
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    employees = employees.page(page).per_page(per_page)
    if params[:sSearch].present?
      employees = employees.where("number like :search name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    employees
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[number name category joining_date exit_date position location]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end