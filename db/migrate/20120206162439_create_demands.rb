class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.integer :period
      t.integer :demand
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
