class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number, null: false
      t.belongs_to :restaurant, index: true
      t.timestamps null: false
    end
  end
end
