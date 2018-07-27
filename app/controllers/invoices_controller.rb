class InvoicesController < ApplicationController
  def update
    respond_to do |format|
      if @invoice.update(order_params)
        format.html { redirect_to @invoice, notice: 'Order was successfully updated.' }
      else
        flash[:error] = @invoice.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end


  private

  def invoice_params
    params.require(:invoice).permit(:invoice_num, ,:order_id, :order_total, :invoice_total, :customer_id, :employee_id, line_items_attributes: [:id, :quantity, :invoice_id, :item_id, :shipped])
  end
  def set_invoice
    @invoice = Order.find(params[:id])
  end

end
