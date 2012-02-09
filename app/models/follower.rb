class Follower < ActiveRecord::Base
  has_many :follower_products, :dependent => :destroy
end
