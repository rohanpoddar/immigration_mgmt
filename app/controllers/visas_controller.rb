class VisasController < ApplicationController
  def index
    @visas= Visa.all( :order=> :visa_type_id)
  end

  def new
    @visa = Visa.new
  end

  def create
    @visa=Visa.new(params[:visa])
    passport= Passport.find_by_passport_number(params[:passportId])
    if passport==nil || params[:visa_type_id].empty?
      flash[:error]='Lol'
      render :new
    else
      @visa.passport=passport
      @visa.visa_type_id=params[:visa_type_id]
      @visa.save
      redirect_to :action => 'index'
    end
  end

  def show
    @visa=Visa.find(params[:id])
  end

  def destroy
    @visa=Visa.find(params[:id])
    @visa.destroy
    redirect_to :action => 'index'
  end

  def edit
    @visa=Visa.find(params[:id])
  end

  def update
    @visa=Visa.find(params[:id])
    @visa.update_attributes(params[:employee])
    redirect_to :action => 'index'
  end
end