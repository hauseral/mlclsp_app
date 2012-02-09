class CreateResourcePeriods < ActiveRecord::Migration
  def self.up
    create_table :resource_periods do |t|
      t.integer :resource_id
      t.integer :period_id
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :resource_periods
  end
end
