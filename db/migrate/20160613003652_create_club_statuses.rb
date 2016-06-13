class CreateClubStatuses < ActiveRecord::Migration
  def change
    create_table :club_statuses do |t|
      t.integer :club_id
      t.integer :status_id
      t.timestamps null: false
    end
  end
end
