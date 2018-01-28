class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :guest_count
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :restaurant
      t.belongs_to :table
      t.belongs_to :visitor
      t.timestamps
    end
  end
end
