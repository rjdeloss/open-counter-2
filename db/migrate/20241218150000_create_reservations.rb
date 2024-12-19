class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.datetime :start_time, null: false
      t.integer :party_size, null: false

      t.timestamps
    end
  end
end
