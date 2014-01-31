class VisasController < ApplicationController
  before_filter :check_if_logged_in
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
      flash[:notice]="Invalid Employee Number!!!"
      render :new
    else
      if employee.passport.visas<<@visa
        flash[:success]="Successfully Inserted Visa!!!"
      else
        flash[:error]=@visa.errors.full_messages<<"Failed to create !!!"
      end
      redirect_to show_visa_path(@visa)
    end
  end

  def show
    @visa=Visa.find_by_id(params[:id])
  end

  def remove
    @visa=Visa.find_by_id(params[:id])
    @visa.delete
    if @visa.save
      flash[:success]="Successfully deleted Visa!!!"
    else
      flash[:error]=@visa.errors.full_messages<<"Failed to delete !!!"
    end
    redirect_to visas_home_path
  end

  def edit
    @visa=Visa.find_by_id(params[:id])
  end

  def update
    @visa=Visa.find_by_id(params[:id])
    if @visa.update_attributes(params[:visa])
      flash[:success]="Successfully Updated Visa"
      redirect_to show_visa_path(@visa)
    else
      flash[:error]=@visa.errors.full_messages<<"Failed To Update !!!"
      redirect_to edit_visa_path(@visa)
    end
  end
end