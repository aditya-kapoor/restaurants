class CreateRestaurantVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_visitors do |t|
      t.belongs_to :restaurant
      t.belongs_to :visitor
      t.timestamps
    end
  end
end
