class CreateProductSolutions < ActiveRecord::Migration
  def self.up
    create_table :product_solutions do |t|
      t.string :product_name
      t.integer :period
      t.integer :production_quantity
      t.integer :inventory
      t.boolean :setup

      t.timestamps
    end
  end

  def self.down
    drop_table :product_solutions
  end
end
