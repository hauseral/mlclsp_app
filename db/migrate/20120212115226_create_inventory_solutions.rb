class CreateInventorySolutions < ActiveRecord::Migration
  def self.up
    create_table :inventory_solutions do |t|
      t.string :product_name
      t.integer :period_name
      t.integer :inventory

      t.timestamps
    end
  end

  def self.down
    drop_table :inventory_solutions
  end
end
