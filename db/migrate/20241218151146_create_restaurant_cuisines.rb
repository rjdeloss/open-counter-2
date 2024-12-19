class CreateRestaurantCuisines < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurant_cuisines do |t|
      t.integer :restaurant_id, null: false
      t.integer :cuisine_id, null: false

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :restaurant_id
  end
end
