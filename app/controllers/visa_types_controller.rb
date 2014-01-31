class VisaTypesController < ApplicationController
  before_filter :check_if_logged_in
  def index
    @visa_types= VisaType.all(:order => :created_at)
  end

  def new
    @visa_type = VisaType.new
  end

  def create
    @visa_type=VisaType.new(params[:visa_type])
    if @visa_type.save
      flash[:success]="Your Visa Type was created !!!"
      redirect_to show_visa_type_path(@visa_type)
    else
      flash[:success]="Failed to create Visa Type !!!"
      render :new
    end
  end

  def show
    @visa_type=VisaType.find_by_name(params[:id])
  end

  def remove
    @visa_type=VisaType.find_by_name(params[:id])
    @visa_type.delete
    if @visa_type.save!
      flash[:success]="Successfully deleted VisaType!!!"
    else
      flash[:error]="Failed to delete !!!"
    end
    render visa_types_home_path
  end

  def edit
    @visa_type=VisaType.find_by_name(params[:id])
  end

  def update
    @visa_type=VisaType.find_by_name(params[:id])
    if @visa_type.update_attributes(params[:visa_type])
      flash[:success]="Successfully Updated Visa Type !!!"
      redirect_to show_visa_type_path(@visa_type)
    else
      flash[:error]="Failed to delete. Please try again"
      redirect_to edit_visa_type_path(@visa_type)
    end
  end
end