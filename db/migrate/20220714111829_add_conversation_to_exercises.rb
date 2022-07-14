class AddConversationToExercises < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercises, :conversation, foreign_key: true
  end
end
