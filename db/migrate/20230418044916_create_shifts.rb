class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.time :start_at
      t.time :finish_at
      t.integer :break_time
      t.integer :hourly_wage
      t.date :date

      t.timestamps
    end
  end
end
