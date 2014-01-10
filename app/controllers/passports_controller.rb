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
      redirect_to :action => 'index'
      end
  end
end
