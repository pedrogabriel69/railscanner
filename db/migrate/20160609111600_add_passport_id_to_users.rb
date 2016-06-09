class AddPassportIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passport_id, :string
  end
end
