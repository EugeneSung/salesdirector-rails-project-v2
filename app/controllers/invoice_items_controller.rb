class InvoiceItemsController < ApplicationController
  def most_ordered_item
      @most_ordered_item= InvoiceItem.most_ordered_item
    if @most_ordered_item
      @item = Item.find(@most_ordered_item.first.item_id)
    else
      flash[:notice] = 'No Ivoice yet'
      redirect_to 'orders_path'
    end


  end
end
