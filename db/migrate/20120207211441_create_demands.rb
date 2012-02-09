class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.integer :product_id
      t.integer :period_id
      t.integer :demand_quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
