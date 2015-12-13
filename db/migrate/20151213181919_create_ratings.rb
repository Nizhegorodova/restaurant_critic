class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :kitchen, null: false
      t.integer :interior, null: false
      t.integer :service, null: false
      t.belongs_to :review, index: true
      t.timestamps null: false
    end
  end
end
