class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.integer :owner_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :teams, :users, column: :owner_id
  end
end
