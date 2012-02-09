class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :product_name
      t.integer :leadtime_shift
      t.string :resource
      t.integer :setup_time
      t.integer :setup_cost
      t.integer :storage_cost
      t.integer :working_time

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
