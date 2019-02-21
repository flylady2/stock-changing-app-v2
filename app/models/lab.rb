class Lab < ActiveRecord::Base
  has_many :users
  has_many :stock_boxes, through: :users
  has_many :stocks, through: :stock_boxes
end
