class AddExerciseToRounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :rounds, :exercise, foreign_key: true
  end
end
