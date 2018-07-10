class SessionsController < ApplicationController

  def index
  end
  def new
    @user = User.new
  end

def create

  @user = User.find_by(user_name: params[:user_name])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    flash[:notice] = 'Signed in successfully.'
    redirect_to salesman_path(@user)
  else
    flash[:notice] = 'Invalid username/password combination'
    render :new
  end


end

def destroy

  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out"
end
end
