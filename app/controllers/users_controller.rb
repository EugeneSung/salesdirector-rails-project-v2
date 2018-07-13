class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def new
    @user = User.new
    @user.contacts.build
    @user.employees.build
    @user.customers.build
  end
def show

end
def edit
end
def create



  @user = User.new(user_params)

  if(@user.valid? and @user.save)
        if @user.admin
          employee = Employee.new
          employee.user_id = @user.id
          employee.user_number = @user.emp_id


          employee.save
          session[:employee_id] = employee.id
        else
          customer = Customer.new
          customer.user_id = @user.id
          customer.user_number = @user.cus_id


          customer.save
          session[:customer_id] = customer.id
        end

        flash[:notice] = "User created successfully"
        session[:user_id] = @user.id
        redirect_to user_path(@user)

    else
        flash[:error] = @user.errors.full_messages.to_sentence
        redirect_to action: "new"
    end

end

def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      format.html { render :edit }
    end
  end
end

def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to user_url, notice: 'User was successfully destroyed.' }
  end
end


private

def user_params
  params.require(:user).permit(:username, :admin, :password, :password_confirmation, contacts_attributes: [:id, :name, :address_1, :address_2, :phone, :city, :state, :zip])
end
def set_user
  @user = User.find(params[:id])
end
end
