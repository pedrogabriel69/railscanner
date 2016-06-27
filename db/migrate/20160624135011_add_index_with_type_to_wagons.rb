class AddIndexWithTypeToWagons < ActiveRecord::Migration
  def change
    add_index :wagons, [:id, :type]
  end
end
