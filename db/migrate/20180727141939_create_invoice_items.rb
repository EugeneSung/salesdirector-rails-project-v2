class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :item_id
      t.integer :quantity
      t.integer :shipped
      t.integer :order_id
      t.integer :item_price
      t.timestamps
    end
  end
end
