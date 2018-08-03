class InvoicesController < ApplicationController

  before_action :set_invoice, only: [:edit, :update, :destroy]
  before_action :set_order, only: [:create, :update]
  before_action :require_admin, only: [:destroy]


  def index
    @invoices = Invoice.all

  end
  def new

    if Invoice.all.empty?
      @invoice_number = "INV#{'%06d' %  1 }"
    else
      @invoice_number = "INV#{'%06d' % (Invoice.all.last.id + 1)}"
    end

    @invoice = Invoice.new
    @invoice.order_id = params[:order_id]
    @order = Order.find_by(id: params[:order_id])

      @invoice.invoice_items.build


  end
  def show
    @order = Order.find_by(id: params[:order_id])
    @invoice = Invoice.find(params[:id])
  end
  def edit

    @key_holder = []
    @order = Order.find_by(id: params[:order_id])
    @invoice_number = @invoice.invoice_num
    reverse_shipped(@invoice)
  end
  def create



  @invoice = Invoice.new(invoice_params)


  if(@invoice.valid? and @invoice.save)

        after_shipped(@invoice)
        flash[:notice] = "Invoice created successfully"

        redirect_to order_invoice_path(@order, @invoice)

    else
        flash[:error] = @invoice.errors.full_messages.to_sentence
        redirect_to new_order_invoice_path(@order)
    end

  end


  def update


    respond_to do |format|
      if @invoice.update(invoice_params)
        after_shipped(@invoice)
        format.html { redirect_to order_invoice_path(@order, @invoice), notice: 'Invoice was successfully updated.' }
      else
        flash[:error] = @invoice.errors.full_messages.to_sentence
        redirect_to edit_order_invoice_path(@order, @invoice)
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Invoice was successfully destroyed.' }
    end
  end


  private

  def invoice_params
    params.require(:invoice).permit(:invoice_num, :order_id, :order_total, :invoice_total, :customer_id, :employee_id, invoice_items_attributes: [:id, :item_price, :invoice_id, :item_id, :quantity, :shipped])
  end
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
  def set_order
    @order = Order.find_by(id: params[:invoice][:order_id])
  end

end
