class SessionsController < ApplicationController
  before_filter :check_if_logged_in, :only =>[:logout]
  before_filter :check_if_not_logged_in, :only =>[:login, :login_check]
  def login_check
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id]=authorized_user.id
      flash[:success] = "Welcome again, you logged in as #{authorized_user.username}"
      redirect_to search_employees_path
    else
      flash[:error] ="Invalid Username or Password"
      redirect_to login_path
    end
  end

  def login
  end

  def logout
    session[:user_id] = nil
    flash[:success]="Logged out !!!"
    redirect_to login_path
  end
end
