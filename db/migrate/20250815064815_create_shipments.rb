class CreateShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :shipments do |t|
      t.integer :tracking_number, null: false
      t.string :status, null: false
      t.string :origin, null: false
      t.string :destination, null: false

      t.timestamps
    end
  end
end
