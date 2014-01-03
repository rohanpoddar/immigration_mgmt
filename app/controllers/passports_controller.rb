class PassportsController < ApplicationController
  def index
    @passports= Passport.all
  end
  def new

  end
  def create
    @passport = Passport.new(params[:bed])
    @passport.save
    #  redirect_to(passports_path)
    #else
    #  redirect_to(new_passports_path)
    #end
  end
end
