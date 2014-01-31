class EmployeesDatatable < BaseDatatable
  delegate :params, :link_to, :show_employee_path, :edit_employee_path, :remove_employee_path, "DT_RowClass", :h, to: :@view

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
    array=Array.new
    employees.each do |employee|
      passport_number = nil
      passport_exit_date = nil
      if employee.passport
        passport_number = employee.passport[:number]
        passport_exit_date = employee.passport[:exit_date]
      end
      array<< {
          "0" => link_to(employee.number, show_employee_path(employee), {:class => "show_link"}),
          "1" => employee.name,
          "2" => h(employee.category),
          "3" => h(employee.joining_date),
          "4" => h(employee.exit_date),
          "5" => h(employee.position),
          "6" => h(employee.location),
          "7" => h(passport_number),
          "8" => h(passport_exit_date),
          "9" => link_to('Edit', edit_employee_path(employee)),
          "10" => link_to("Remove", remove_employee_path(employee), method: :put, data: {confirm: 'Are you sure?'}),
          "DT_RowClass" => "#{h(return_color(employee))}"
      }
    end
    array
  end

  def return_color(employee)
    if employee.passport==nil || employee.passport.isExpired? || employee.passport.isDeleted?
      return "danger"
    end
    return "success"
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    employees = employees.page(page).per_page(per_page)
    if params[:sSearch].present?
      employees = employees.where("number ilike :search or name ilike :search or category ilike :search", search: "%#{params[:sSearch]}%")
    end
    employees
  end

  def sort_column
    columns = %w[number name category joining_date exit_date position location]
    columns[params[:iSortCol_0].to_i]
  end

end