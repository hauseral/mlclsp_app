class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.string :product_name
      t.integer :period
      t.integer :demand_quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
