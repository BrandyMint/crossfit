class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :workout, index: true, foreign_key: true
      t.belongs_to :wod, index: true, foreign_key: true
      t.text :notes
      t.date :date, null: false

      t.timestamps
    end
  end
end
