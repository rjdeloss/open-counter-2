class CreateCuisines < ActiveRecord::Migration[8.0]
  def change
    create_table :cuisines do |t|
      t.string :cuisine, null: false

      t.timestamps
    end
  end
end
