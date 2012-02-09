class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :resource
      t.integer :period
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
