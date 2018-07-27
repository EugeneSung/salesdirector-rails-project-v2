class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :invoice_num
      t.integer :order_total
      t.integer :customer_id
      t.integer :employee_id
      t.integer :order_id
      t.integer :invoice_total
      t.timestamps
    end
  end
end
