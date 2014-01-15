class PassportsController < ApplicationController
  def index
    @passports= Passport.all
  end
  def new
    @passport = Passport.new
  end
  def create
    @passport = Passport.new(params[:passport])
      employee_id=Employee.find_by_employee_number(params[:passport][:employee_id])
      @passport.employee_id=employee_id
      if @passport.save
        flash[:success]="Created Successfully !!!"
        redirect_to :action => 'index'
      else
        flash[:error]="Failed to create Passport !!! #{params.inspect}"
        redirect_to :action => 'index'
      end
  end
  def edit
    @passport = Passport.find_by_id(params[:id])
  end

  def update
    @passport = Passport.find_by_id(params[:id])
    @passport.update_attributes(params[:passport])
    redirect_to :action => 'index'
  end

  def destroy
    @passport = Passport.find_by_id(params[:id])
    @passport.destroy
    redirect_to :action => 'index'
  end
end
