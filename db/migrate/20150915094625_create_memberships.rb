class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :member_id, null: false, index: true
      t.integer :team_id, null: false
      t.string :role, null: false

      t.timestamps null: false
    end

    add_index :memberships, [:team_id, :member_id], unique: true
  end
end
