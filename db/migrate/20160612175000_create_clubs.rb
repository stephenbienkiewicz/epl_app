class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :nickname
      t.string :manager
      t.string :rank

      t.timestamps null: false
    end
  end
end
