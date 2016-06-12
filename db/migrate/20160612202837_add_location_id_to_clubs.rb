class AddLocationIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :location_id, :integer
  end
end
