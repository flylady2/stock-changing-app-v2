class CreateStockBoxesTable < ActiveRecord::Migration
  def change
    create_table :stock_boxes do |t|
      t.string :name
      t.text :content
      t.date  :date_changed
      t.date :date_due
      t.integer :user_id
      t.timestamps null: false
    end

  end
end
