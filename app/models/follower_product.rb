class FollowerProduct < ActiveRecord::Base
  belongs_to :follower, :class_name => "Follower"
  belongs_to :product, :class_name => "Product"
end
