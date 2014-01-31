class ApplicationController < ActionController::Base
  protected
  def check_if_logged_in
    session[:user_id]=1 if Rails.env=='test'
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return true
    else
      flash[:notice]="You need To be Logged In !!!"
      redirect_to login_path
      return false
    end
  end

  def check_if_not_logged_in
    session[:user_id]=1 if Rails.env=='test'
    if session[:user_id]
      flash[:notice]="You need to Logged Out for that!!!"
      redirect_to search_employees_path
      return false
    else
      return true
    end
  end

  def error_page

  end
end
