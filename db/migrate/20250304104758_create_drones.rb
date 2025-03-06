class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.string :photo_url
      t.text :description
      t.integer :price_per_day
      t.float :flight_time
      t.float :max_altitude
      t.float :max_wind_resistance
      t.float :max_resolution
      t.float :max_flight_distance
      t.timestamps
    end
  end
end
