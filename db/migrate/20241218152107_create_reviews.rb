class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :overall_rating
      t.integer :food_rating
      t.integer :service_rating
      t.integer :ambiance_rating
      t.integer :value_rating
      t.text :body

      t.timestamps
    end
  end
end
