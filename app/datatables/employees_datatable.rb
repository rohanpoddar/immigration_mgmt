class EmployeesDatatable
  delegate :params,:link_to,:edit_employee_path,:remove_employee_path, :h, to: :@view

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
  end

  private

  def data
    employees.map do |employee|
      [
          link_to(employee.number,employee),
          h(employee.name),
          h(employee.category),
          h(employee.joining_date),
          h(employee.exit_date),
          h(employee.location),
          h(employee.position),
          link_to('edit',edit_employee_path(employee)),
          link_to("delete", employee, method: :delete, data: { confirm: 'Are you sure?' }),
          link_to("Remove", remove_employee_path(employee),method: :put ,data: { confirm: 'Are you sure?' })
      ]
    end
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    employees = employees.page(page).per_page(per_page)
    if params[:sSearch].present?
      employees = employees.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end