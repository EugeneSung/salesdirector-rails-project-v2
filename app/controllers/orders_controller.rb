class OrdersController < ApplicationController

    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def index
      @orders = Order.all
    end
    def new
      @order = Order.new
      if User.find_by_id(params[:user_id]).admin
        @order.employee_id = params[:user_id]

      else
        @order.customer_id = params[:user_id]
      end

    5.times do
           @order.line_items.build
         end
  end
  def show

  end
  def edit
  end
  def create



    @order = Order.new(order_params)

    if(@order.valid? and @order.save)

          flash[:notice] = "Order created successfully"

          redirect_to order_path(@order)

      else
          flash[:error] = @order.errors.full_messages.to_sentence
          redirect_to action: "new"
      end

  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        flash[:error] = @order.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end


  private

  def order_params
    params.require(:order).permit(:order_num, :total, :customer_id, :employee_id, line_items_attributes: [:id, :quantity, :order_id, :item_id])
  end
  def set_order
    @order = Order.find(params[:id])
  end

end