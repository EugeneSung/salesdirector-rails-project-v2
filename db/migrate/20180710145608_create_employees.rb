class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :title
      t.boolean :status, :default => true
      t.integer :user_id
      t.string :user_number

      t.timestamps
    end
  end
end
