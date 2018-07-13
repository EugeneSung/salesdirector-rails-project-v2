class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_type
      t.integer :price
      t.string :name
      t.string :desc
      t.integer :inventory

      t.timestamps
    end
  end
end
