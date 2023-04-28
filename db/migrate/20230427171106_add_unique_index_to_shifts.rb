class AddUniqueIndexToShifts < ActiveRecord::Migration[7.0]
  def change
    add_index :shifts, [:user_id, :date], unique: true
  end
end
