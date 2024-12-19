class AddIndexToTables < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true

    add_index :restaurants, :city
    add_index :restaurants, :zip
    add_index :restaurants, :price_range

    add_index :reservations, :user_id
    add_index :reservations, :restaurant_id

    add_index :favorites, :user_id
    add_index :favorites, :restaurant_id

    add_index :cuisines, :cuisine

    add_index :reviews, :user_id
    add_index :reviews, :restaurant_id
  end
end
