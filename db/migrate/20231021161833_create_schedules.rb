class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_day
      t.date :end_day
      t.boolean :all_day
      t.string :memo

      t.timestamps
    end
  end
end
