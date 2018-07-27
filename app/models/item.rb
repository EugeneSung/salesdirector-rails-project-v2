class Item < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  has_many :invoice_items
  has_many :invoices, through: :invoice_items


end
