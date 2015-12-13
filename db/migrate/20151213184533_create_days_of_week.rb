class CreateDaysOfWeek < ActiveRecord::Migration
  def change
    create_table :days_of_week do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
