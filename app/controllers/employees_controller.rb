class EmployeesController < ApplicationController
  before_filter :check_if_logged_in
  def index
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.xls do
        response.headers['Content-Disposition'] = 'attachment; filename="SearchResult.xls"'
      end
      format.json { render json: EmployeesDatatable.new(view_context) }
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee=Employee.new(params[:employee])
    if @employee.save
      flash[:success]="success"
      if (params[:commit] == "SAVE")
        redirect_to show_employee_path(@employee)
      else
        redirect_to "/passports/new?employee_number=#{@employee.number}"
      end
    else
      flash[:error]=@employee.errors.full_messages<<"Unable to create !!!"
      redirect_to new_employee_path
    end
  end

  def show
    @employee=Employee.find_by_number(params[:id])
  end

  def remove
    @employee=Employee.find_by_number(params[:id])
    @employee.delete
    if @employee.save!
      flash[:notice]="Employee deleted Successfully !!!"
    else
      flash[:error]=@employee.errors.full_messages<<"Unable to delete !!!"
    end
    redirect_to :action => 'index'
  end

  def edit
    @employee=Employee.find_by_number(params[:id])
  end

  def update
    @employee=Employee.find_by_number(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:success]="Success !!!"
      if (params[:commit]=="SAVE")
        redirect_to show_employee_path
      else
        if (@employee.passport.nil?)
          redirect_to "/passports/new?employee_number=#{@employee.number}"
        else
          redirect_to "/passports/#{@employee.passport.number}/edit"
        end
      end
    else
      flash[:error]=@employee.errors.full_messages<<"Unable to update !!!"
      redirect_to edit_employee_path
    end
  end

end
