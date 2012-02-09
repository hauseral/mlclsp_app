class Product < ActiveRecord::Base
  # has_many :resources, :dependent => :destroy
   has_many :demands, :dependent => :destroy


 # belongs_to :demand, :class_name => Demand
 # has_many :dependencies, :dependent => :destroy
 # belongs_to :follower_product, :class_name => "FollowerProduct"
  has_many :follower_products, :dependent => :destroy
end
