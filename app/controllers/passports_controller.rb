class PassportsController < ApplicationController
  def index
    @passports= Passport.all
  end
  def new
    @passport = Passport.new
  end
  def create
    @passport = Passport.new(params[:passport])
      if @passport.save
        redirect_to :action => 'index'
      else
        flash[:error]="Failed to create passport"
        redirect_to :action => 'index'
      end
  end
  def edit
    @passport = Passport.find(params[:id])
  end

  def update
    @passport = Passport.find(params[:id])
    @passport.update_attributes(params[:passport])
    redirect_to :action => 'index'
  end
end
