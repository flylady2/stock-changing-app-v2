class User < ActiveRecord::Base
  has_secure_password
  has_many :stock_boxes
  has_many :stocks, through: :stock_boxes

end
