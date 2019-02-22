class CreateLabsTable < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
    end
  end
end
