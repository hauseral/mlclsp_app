class Product < ActiveRecord::Base
  # has_many :resources, :dependent => :destroy
  # has_many :demands, :dependent => :destroy


  belongs_to :demand, :class_name => Demand
  has_many :dependencies, :dependent => :destroy
  # belongs_to :resource, :class_name => Resource
 # has_many :product_solutions, :dependent => :destroy
end
