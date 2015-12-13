class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :zip, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.decimal :lat, precision: 10, scale: 6, null: false
      t.decimal :lon, precision: 10, scale: 6, null: false
      t.belongs_to :restaurant, index: true
      t.timestamps null: false
    end
  end
end
