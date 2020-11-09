class CreateDeliveryInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_informations do |t|
      t.string  :zip_code,             null:        false
      t.integer :forwarding_origin_id, null:        false
      t.string  :municipality,         null:        false
      t.string  :address,              null:        false
      t.string  :building_name
      t.string  :phone_number,         null:        false
      t.references :order,             foreign_key: true
      t.timestamps
    end
  end
end
