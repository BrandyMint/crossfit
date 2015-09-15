class CreateAthleteWodLogs < ActiveRecord::Migration
  def change
    create_table :athlete_wod_logs do |t|
      t.integer :athlete_wod_id, null: false, unique: true
      t.text :notes

      t.timestamps
    end
  end
end
