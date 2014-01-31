class UsersController < ApplicationController
  before_filter :check_if_logged_in, :only => [:show]
  before_filter :check_if_not_logged_in, :only => [:create, :new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Account registered!!!"
      redirect_to login_path
    else
      flash[:error] =@employee.errors.full_messages<<"Account Registration Failed!!!"
      render signup_path
    end
  end

  def show
    @user = @current_user
  end



end