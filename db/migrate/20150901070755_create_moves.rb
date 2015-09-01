class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.belongs_to :workout, index: true, foreign_key: true
      t.belongs_to :exercise, index: true, foreign_key: true

      t.integer :reps, null: false, default: 0
      t.integer :weight_kilos, null: false, default: 0
      t.integer :distance_meters, null: false, default: 0
      t.integer :height_meters, null: false, default: 0
      t.integer :time_seconds, null: false, default: 0
    end
  end
end
