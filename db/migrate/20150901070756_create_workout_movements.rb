class CreateWorkoutMovements < ActiveRecord::Migration
  def change
    create_table :workout_movements do |t|
      t.integer :workout_id, null: false
      t.integer :original_movement_id

      t.string  :custom_title

      t.integer :custom_reps,            null: false, default: 0
      t.decimal :custom_weight_kilos,    null: false, default: 0
      t.decimal :custom_distance_meters, null: false, default: 0
      t.decimal :custom_height_meters,   null: false, default: 0
      t.integer :custom_time_seconds,    null: false, default: 0

      t.timestamps null: false
    end

    add_foreign_key :workout_movements, :workouts, column: :workout_id
    add_foreign_key :workout_movements, :movements, column: :original_movement_id
  end
end
