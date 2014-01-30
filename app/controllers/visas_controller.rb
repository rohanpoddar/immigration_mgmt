class VisasController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: VisasDatatable.new(view_context) }
    end
  end

  def new
    @visa = Visa.new
  end

  def create
    @visa=Visa.new(params[:visa])
    employee= Employee.find_by_number(params[:employee_number])
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
    @visa=Visa.find_by_id(params[:id])
  end

  def remove
    @visa=Visa.find_by_id(params[:id])
    @visa.delete
    if @visa.save!
      flash[:success]="Successfully deleted Visa!!!"
    else
      flash[:error]="Failed to delete !!!"
    end
    redirect_to :action => 'index'
  end

  def edit
    @visa=Visa.find_by_id(params[:id])
  end

  def update
    @visa=Visa.find_by_id(params[:id])
    @visa.update_attributes(params[:visa])
    redirect_to :action => 'index'
  end
end