class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
      t.string :product_name
      t.string :follower
      t.integer :coefficient

      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end
