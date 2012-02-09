class CreateFollowers < ActiveRecord::Migration
  def self.up
    create_table :followers do |t|
      t.string :follower_name

      t.timestamps
    end
  end

  def self.down
    drop_table :followers
  end
end
