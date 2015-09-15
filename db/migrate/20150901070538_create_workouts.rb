class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :owner_id
      t.string :title, null: false
      t.text :description
      t.text :pre_workout
      t.text :special_pre_workout
      t.text :post_workout

      t.integer :rounds, null: false, default: 1

      t.timestamps
    end

    add_foreign_key :workouts, :users, column: :owner_id
  end
end
