class PassportsDatatable < BaseDatatable
  delegate :params, :link_to, :show_passport_path, :edit_passport_path, :remove_passport_path, "DT_RowClass", :h, to: :@view

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Passport.new.class.count,
        iTotalDisplayRecords: passports.total_entries,
        aaData: data
    }
  end

  private

  def data
    array=Array.new
    passports.each do |passport|
      array<<{
          "0" => link_to(h(passport.number), show_passport_path(passport), {:class => "show_link"}),
          "1" => h(passport.employee.name),
          "2" => h(passport.employee_number),
          "3" => h(passport.citizenship),
          "4" => h(passport.expiry_date),
          "5" => link_to('Edit', edit_passport_path(passport)),
          "6" => link_to("Remove", remove_passport_path(passport), method: :put, data: {confirm: 'Are you sure?'}),
          "DT_RowClass" => "#{h(return_color(passport))}"
      }
    end
    array
  end

  def return_color(passport)
    if passport.isExpired? || passport.isDeleted?
      return "danger"
    end
    return "success"
  end

  def passports
    @passports ||= fetch_passports
  end

  def fetch_passports
    passports = Passport.order("#{sort_column} #{sort_direction}")
    passports = passports.page(page).per_page(per_page)
    if params[:sSearch].present?
      passports = passports.where("number like :search", search: "%#{params[:sSearch]}%")
    end
    passports
  end

  def sort_column
    columns = %w[TABLE COLUMNS HERE]
    columns[params[:iSortCol_0].to_i]
    "employee_number"
  end
end