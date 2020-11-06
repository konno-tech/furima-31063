class CreateDeliveryInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_informations do |t|
      t.string  :zip_code,      presence: true
      t.integer :prefecture_id, presence: true
      t.string  :municipality,  presence: true
      t.string  :address,       presence: true
      t.string  :building_name
      t.string  :phone_number,  presence: true
      t.references :order,      foreign_key: true
      t.timestamps
    end
  end
end
