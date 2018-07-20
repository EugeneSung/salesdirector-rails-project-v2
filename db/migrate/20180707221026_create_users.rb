class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.boolean :admin, :default=> false
      t.string :user_number
      t.boolean :status, :default => true
      t.string :name
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
  end
end
