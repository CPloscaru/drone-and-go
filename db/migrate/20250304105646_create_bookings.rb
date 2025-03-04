class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :drone, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.date :starting_date
      t.date :ending_date
      t.float :total_price

      t.timestamps
    end
  end
end
