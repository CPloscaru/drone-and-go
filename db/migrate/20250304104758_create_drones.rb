class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :price_per_day
      t.integer :price_for_lease
      t.float :autonomy_rating
      t.float :stability_rating
      t.float :camera_quality_rating
      t.float :range_rating

      t.timestamps
    end
  end
end
