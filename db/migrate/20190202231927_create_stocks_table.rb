class CreateStocksTable < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :box_name
      t.integer :stock_box_id
      t.timestamps null:false
    end

  end
end
