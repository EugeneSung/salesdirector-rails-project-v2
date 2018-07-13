class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :user_number
      t.string :type
      t.boolean :status, :default => true
      t.integer :user_id

      t.timestamps
    end
  end
end
