class InvoiceItemsController < ApplicationController
  def most_ordered_item

    @most_ordered_item= InvoiceItem.most_ordered_item
    @item = Item.find(@most_ordered_item.item_id)


  end
end
