class Demand < ActiveRecord::Base
  belongs_to :product, :class_name => "Product"
  belongs_to :period, :class_name => "Period"
end
