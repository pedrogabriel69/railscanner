class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :initial_station
      t.string :final_station
      t.string :name
      t.string :surname
      t.string :passport_id

      t.timestamps null: false
    end
  end
end
