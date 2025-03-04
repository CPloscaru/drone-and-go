class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.text :description
      t.string :category
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
