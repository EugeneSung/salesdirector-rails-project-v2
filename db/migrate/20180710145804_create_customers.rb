class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :cus_num
      t.string :type
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
