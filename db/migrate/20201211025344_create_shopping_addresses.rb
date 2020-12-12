class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.string     :postal_code,   null: false, default: ""
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false, default: ""
      t.string     :house_number,  null: false, default: ""
      t.string     :building_name, default: ""
      t.string     :phone_number,  null: false, default: ""
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
