class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
