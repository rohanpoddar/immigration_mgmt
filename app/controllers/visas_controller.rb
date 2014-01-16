class VisasController < ApplicationController
  def index
    @visas= Visa.all( :order=> :visa_type_id)
  end

  def new
    @visa = Visa.new
  end

  def create
    @visa=Visa.new(params[:visa])
    employee= Employee.find_by_employee_number(params[:employee_number])
    if employee==nil
      flash[:notice]="Invalid Employee Number"
      render :new
    else
      if employee.passport.visas<<@visa
        flash[:success]="Successfully Inserted Visa!!!"
      else
        flash[:error]="Failed to create"
      end
      redirect_to :action => 'index'
    end
  end

  def show
    @visa=Visa.find(params[:id])
  end

  def destroy
    @visa=Visa.find(params[:id])
    if @visa.destroy
      flash[:success]="Successfully deleted Visa!!!"
    else
      flash[:error]="Failed to delete !!!"
    end
    redirect_to :action => 'index'
  end

  def edit
    @visa=Visa.find(params[:id])
  end

  def update
    @visa=Visa.find(params[:id])
    @visa.update_attributes(params[:visa])
    redirect_to :action => 'index'
  end
end