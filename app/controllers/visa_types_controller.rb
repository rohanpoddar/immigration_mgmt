class VisaTypesController < ApplicationController
  def index
    @visa_types= VisaType.all( :order=> :created_at)
  end

  def new
    @visa_type = VisaType.new
  end

  def create
    @visa_type=VisaType.new(params[:visa_type])
    if  params[:visa_type]==nil
      flash[:error]='Lol'
      render :new
    else
      @visa_type.save
      redirect_to :action => 'index'
    end
  end

  def show
    @visa_type=VisaType.find(params[:id])
  end

  def destroy
    @visa_type=VisaType.find(params[:id])
    @visa_type.destroy
    redirect_to :action => 'index'
  end

  def edit
    @visa_type=VisaType.find(params[:id])
  end

  def update
    @visa_type=VisaType.find(params[:id])
    @visa_type.update_attributes(params[:visa_type])
    redirect_to :action => 'index'
  end
end