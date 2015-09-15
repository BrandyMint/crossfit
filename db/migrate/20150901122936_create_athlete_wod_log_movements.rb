class CreateAthleteWodLogMovements < ActiveRecord::Migration
  def change
    create_table :athlete_wod_log_movements do |t|
      t.belongs_to :athlete_wod_log, null: false, index: true, foreign_key: true
      t.belongs_to :workout_movement, null: false, index: true, foreign_key: true

      t.integer :reps, null: false, default: 0
      t.integer :weight_kilos, null: false, default: 0
      t.integer :distance_meters, null: false, default: 0
      t.integer :height_meters, null: false, default: 0
      t.integer :time_seconds, null: false, default: 0
    end

    add_index :athlete_wod_log_movements, [:athlete_wod_log_id, :workout_movement_id], unique: true, name: :index_athlete_wod_log_movements_unique
  end
end
