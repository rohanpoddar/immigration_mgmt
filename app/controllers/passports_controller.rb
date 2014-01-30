class PassportsController < ApplicationController
  before_filter :check_if_logged_in
  def index
    respond_to do |format|
      format.html
      format.json { render json: PassportsDatatable.new(view_context) }
    end
  end

  def new
    @passport = Passport.new
  end

  def create
    @passport = Passport.new(params[:passport])
    if params[:employee_number]!=nil
      @passport.employee_number=params[:employee_number]
    end
    if @passport.save
      flash[:success]="Created Successfully !!!"
      redirect_to :action => 'index'
    else
      flash[:error]="Failed to create Passport !!! #{params.inspect}"
      redirect_to :action => 'index'
    end
  end

  def edit
    @passport = Passport.find_by_number(params[:id])
  end

  def show
    @passport = Passport.find_by_number(params[:id])
  end

  def update
    @passport = Passport.find_by_number(params[:id])
    if @passport.update_attributes(params[:passport])
      flash[:success]="Success !!!"
      redirect_to show_passport_path
    else
      flash[:error]="Failed to update Passport !!! "
      redirect_to edit_passport_path
    end
  end

  def remove
    @passport = Passport.find_by_number(params[:id])
    @passport.delete
    if @passport.save
      flash[:success]="Successfully deleted Passport!!!"
    else
      flash[:error]="Failed to delete !!!"
    end
    redirect_to :action => 'index'
  end

end
