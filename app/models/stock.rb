class Stock < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock_boxes
end
