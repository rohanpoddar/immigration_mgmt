class VisasController < ApplicationController
  def index
    @visas= Visa.all( :order=> :visa_type_id)
  end

  def new
    @visa = Visa.new
  end

  def create
    @visa=Visa.new(params[:visa])
    passport= Passport.find_by_passport_number(params[:visa][:passport_id])
    if passport==nil
      flash[:notice]="Invalid Passport Number"
      render :new
    else
      @visa.passport=passport
      @visa.visa_type_id=params[:visa][:visa_type_id]
      if @visa.save
        flash[:success]="Successfully Inserted Visa!!!"
      else
        flash[:error]="Failed to create"
      end
      redirect_to :action => 'index'
    end
  end

  def show
    @visa=Visa.find(params[:id])
  end

  def destroy
    @visa=Visa.find(params[:id])
    if @visa.destroy
      flash[:success]="Successfully deleted Visa!!!"
    else
      flash[:error]="Failed to delete !!!"
    end
    redirect_to :action => 'index'
  end

  def edit
    @visa=Visa.find(params[:id])
  end

  def update
    @visa=Visa.find(params[:id])
    @visa.update_attributes(params[:visa])
    redirect_to :action => 'index'
  end
end