class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :title
      t.boolean :status
      t.integer :user_id

      t.timestamps
    end
  end
end
