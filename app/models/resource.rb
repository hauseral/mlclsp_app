class Resource < ActiveRecord::Base
  has_many :resource_periods, :dependent => :destroy
 # belongs_to :product, :class_name => Product
end
