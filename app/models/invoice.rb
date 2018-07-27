class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :employee
  belongs_to :order


  has_many :invoice_items
  has_many :items, through: :invoice_items
end
