class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :password_hash
      t.string :password_salt
      t.string :name
      t.integer :age
      t.string :session_token
      t.timestamps null: false
    end
  end
end
