class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :min_guest_capacity, null: false, default: 1
      t.integer :max_guest_capacity
      t.belongs_to :restaurant
      t.timestamps
    end
  end
end
