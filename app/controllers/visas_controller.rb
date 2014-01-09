class VisasController < ApplicationController
  def index
    @visas= Visa.all
  end

  def new
    @visa = Visa.new(params[:bed])
    @visa.save
    #  redirect_to(passports_path)
    #else
    #  redirect_to(new_passports_path)
    #end
  end
end