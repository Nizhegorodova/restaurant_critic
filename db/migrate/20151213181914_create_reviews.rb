class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :critique, null: false
      t.belongs_to :restaurant, index: true
      t.timestamps null: false
    end
  end
end
