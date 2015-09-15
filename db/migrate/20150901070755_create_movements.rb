class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :owner_id
      t.string :title, null: false

      t.integer :reps,            null: false, default: 0
      t.decimal :weight_kilos,    null: false, default: 0
      t.decimal :distance_meters, null: false, default: 0
      t.decimal :height_meters,   null: false, default: 0
      t.integer :time_seconds,    null: false, default: 0
    end

    add_foreign_key :movements, :users, column: :owner_id

    add_index :movements, [:title], unique: true
  end
end
