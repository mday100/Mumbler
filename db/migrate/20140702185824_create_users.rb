class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :password
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
