class Order < ApplicationRecord


  belongs_to :customer
  belongs_to :employee
  has_many :invoices
  has_many :line_items
  has_many :items, through: :line_items
  validates :employee_id, :customer_id, presence: true

  accepts_nested_attributes_for :line_items, :allow_destroy => true
  scope :ordered_employees, -> { group(:employee_id)}
  scope :ordered_customers, -> { group(:customer_id)}
  scope :totals, -> { group(:order_total)}
  scope :total_max, -> {order(:order_total, :desc) }
  scope :big_orders, -> {totals.total_max.limit(3)}

  def sum
    total = 0

    if self.line_items.empty? != true
      self.line_items.each do |line_item|
        if !!line_item.quantity
          total = total + (line_item.item.price * line_item.quantity)
        end

      end

    else
      flash[:notice] = 'No orders'

    end



      total

  end
end
