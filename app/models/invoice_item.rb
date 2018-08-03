class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice


  scope :most_ordered_item, ->{
    group(:item_id).order('SUM(shipped) desc').limit(1);


  }



end
