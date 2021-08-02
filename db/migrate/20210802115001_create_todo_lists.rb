class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.string :objective
      t.references :campaign

      t.timestamps
    end
  end
end
