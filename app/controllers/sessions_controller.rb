class SessionsController < ApplicationController

  def index
  end
  def new
    @user = User.new
  end

def create

  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    if @user.admin
        employee = Employee.find_by_user_id(@user.id)
        session[:employee_id] = employee.id

    else
      customer = Customer.find_by_user_id(@user.id)
      session[:customer_id] = customer.id

    end
    flash[:notice] = 'Signed in successfully.'
    redirect_to user_path(@user)
  else
    flash[:notice] = 'Invalid username/password combination'
    render :new
  end


end

def destroy

  session[:user_id] = nil
  session[:customer_id] = nil
  session[:employee_id] = nil
  reset_session
  redirect_to root_url, notice: "Logged out"
end
end
