class EmployeesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json{render json: EmployeesDatatable.new(view_context)}
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
        redirect_to  '/employees/#{@employee.number}'
      else
        redirect_to "/passports/new?employee_number=#{@employee.number}"
      end
    else
      flash[:danger]="#{params.inspect}<br/>#{@employee.errors.full_messages}"
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
      flash[:danger]="Unable to delete !!!"
    end
    redirect_to :action => 'index'
  end

  def edit
    @employee=Employee.find_by_number(params[:id])
  end

  def update
    @employee=Employee.find_by_number(params[:id])
    @employee.update_attributes(params[:employee])
    if (params[:commit]=="SAVE")
      redirect_to '/employees/#{@employee.number}'
    else
      if (@employee.passport.nil?)
        redirect_to "/passports/new?employee_number=#{@employee.number}"
      else
        redirect_to "/passports/#{@employee.passport.number}/edit?employee_number=#{@employee.number}"
      end
    end
  end

  def search
    @employees=Employee.search(params[:search])
  end

end
