class CustomersController < ApplicationController

  before_action :require_admin, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  def index
    @customers = Customer.all

  end
  def new
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)


    if@user.save

           redirect_to user_path(current_user)

    else

          redirect_to action: "new"
    end

  end


  private

  def customer_params
    params.require(:customer).permit(:type, :user_id)
  end

end
