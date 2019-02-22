class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.string :password_digest
      t.integer :lab_id
      t.timestamps null: false
    end

  end
end
