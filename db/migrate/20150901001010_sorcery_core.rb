class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone, null: false
      t.string :crypted_password
      t.string :salt
      t.string :pin, null: false

      t.string :full_name
      t.string :nick, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true

    add_index :users, :nick, unique: true
  end
end
