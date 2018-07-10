class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.boolean :admin, :default=> false
      t.string :user_number
      t.timestamps
    end
  end
end
