class CreateSalesRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_records do |t|
      t.integer    :price, null:        false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
