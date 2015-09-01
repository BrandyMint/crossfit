class CreatesWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.belongs_to :workout, null: false, index: true, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
