class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.references :day_of_week, index: true
      t.belongs_to :restaurant, index: true
      t.timestamps null: false
    end
  end
end
