class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :type
      t.string :up_seat
      t.string :down_seat

      t.timestamps null: false
    end
  end
end
