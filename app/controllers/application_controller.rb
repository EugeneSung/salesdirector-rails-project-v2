class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :logged_in?, :current_employee, :current_customer

  # def cart
  #   session[:cart] ||= []
  # end



  private

  def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def current_employee
   @current_employee ||= Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end
  def current_customer
   @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
  end

  def logged_in?
   !!current_user
  end
  def require_login
    redirect_to root_url  unless current_user
  end
  def require_admin
    redirect_to user_path(current_user)  unless current_user.admin
  end

end
