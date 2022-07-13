class ChangeStepsToRounds < ActiveRecord::Migration[5.2]
  def change
    rename_table :steps, :rounds
  end
end
