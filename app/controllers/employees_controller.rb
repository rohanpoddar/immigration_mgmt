class EmployeesController < ApplicationController
  def index
    @employees=Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee=Employee.new(params[:employee])
    if @employee.save
      flash[:success]="success"
      if (params[:commit] == "SAVE")
        redirect_to :action => 'index'
      else
        redirect_to "/passports/new?employee_number=#{@employee.employee_number}"
      end
    else
      flash[:danger]="#{params.inspect}"
      redirect_to :action => 'index'
    end
  end

  def show
    @employee=Employee.find_by_id(params[:id])
  end

  def destroy
    @employee=Employee.find_by_id(params[:id])
    @employee.destroy
    redirect_to :action => 'index'
  end

  def edit
    @employee=Employee.find_by_id(params[:id])
  end

  def update
    @employee=Employee.find_by_id(params[:id])
    @employee.update_attributes(params[:employee])
    if (params[:commit]=="SAVE")
      redirect_to :action => 'index'
    else
      if (@employee.passport.nil?)
        redirect_to "/passports/new?employee_number=#{@employee.employee_number}"
      else
        redirect_to "/passports/#{@employee.passport.id}/edit?employee_number=#{@employee.employee_number}"
      end
    end
  end

  def search
    @employees=Employee.search(params[:search])
  end

end
