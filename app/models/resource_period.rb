class ResourcePeriod < ActiveRecord::Base
  belongs_to :resource, :class_name => "Resource"
  belongs_to :period, :class_name => "Period"
end
