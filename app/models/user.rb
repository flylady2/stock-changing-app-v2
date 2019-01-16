class User < ActiveRecord::Base
  has_many :stock_boxes
  has_many :stocks, through :stock_boxes

end
