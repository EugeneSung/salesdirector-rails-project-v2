class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_num
      t.integer :total
      t.integer :customer_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
