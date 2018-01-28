class AddShiftTimingsToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :shift_timings, :text
  end
end
