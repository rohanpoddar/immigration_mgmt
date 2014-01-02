class PassportsController < ApplicationController
  def index
    #redirect_to(new_passports_path)
  end
  def new

  end
  def create
    puts "$$$$$$$$ in create"
    @passport = Passport.new(params[:bed])
    @passport.save
    #  redirect_to(passports_path)
    #else
    #  redirect_to(new_passports_path)
    #end
  end
end
