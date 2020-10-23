class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                null: false
      t.text :details,               null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :region_id,          null: false
      t.integer :period_id,          null: false
      t.string :price,               null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
