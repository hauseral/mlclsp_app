class Period < ActiveRecord::Base
  has_many :demands, :dependent => :destroy
  has_many :resource_periods, :dependent => :destroy
end
