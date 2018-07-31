class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :employee
  belongs_to :order

  has_many :invoice_items
  has_many :items, through: :invoice_items

  accepts_nested_attributes_for :invoice_items, :allow_destroy => true


  def total
    result = 0

    if self.invoice_items.empty? != true
      self.invoice_items.each do |invoice_item|
        if !!invoice_item.shipped
          result = result + (invoice_item.item.price * invoice_item.shipped)
        end

      end

    else
      flash[:notice] = 'No orders'

    end



      result

  end



end
