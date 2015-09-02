class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
