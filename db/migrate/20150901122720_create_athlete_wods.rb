class CreateAthleteWods < ActiveRecord::Migration
  def change
    create_table :athlete_wods do |t|
      t.integer :trainer_id, null: false
      t.integer :athlete_id, null: false
      t.integer :workout_id, null: false
      t.date :date, null: false

      t.timestamps
    end

    add_foreign_key :athlete_wods, :users, column: :trainer_id
    add_foreign_key :athlete_wods, :users, column: :athlete_id
    add_foreign_key :athlete_wods, :workouts, column: :workout_id

    add_index :athlete_wods, [:athlete_id, :date], unique: true
  end
end
