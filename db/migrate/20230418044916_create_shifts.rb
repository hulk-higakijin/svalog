class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.time :start_at, null: false
      t.time :finish_at, null: false
      t.integer :break_time, null: false, default: 0
      t.integer :hourly_wage, null: false, default: 0
      t.date :date, null: false

      t.timestamps
    end
  end
end
