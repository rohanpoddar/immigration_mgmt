class EmployeesController < ApplicationController
  def index
    @employees=Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee=Employee.new(params[:employee])
    @employee.save
    redirect_to :action => 'index'
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
    redirect_to :action => 'index'
  end

  def search
    @employees=Employee.search(params[:search])
  end

end
