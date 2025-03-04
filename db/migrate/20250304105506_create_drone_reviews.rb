class CreateDroneReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :drone_reviews do |t|
      t.float :rating
      t.text :comment
      t.references :drone, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
