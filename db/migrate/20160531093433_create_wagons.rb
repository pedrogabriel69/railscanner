class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :type
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :economy_bottom_seats

      t.timestamps null: false
    end
  end
end
