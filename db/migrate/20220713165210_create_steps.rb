class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :name
      t.integer :count_of_repeat
      t.integer :relax

      t.timestamps
    end
  end
end
