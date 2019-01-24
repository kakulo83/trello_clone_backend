class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.integer :board_id
      t.integer :user_id
      t.timestamps
    end
  end
end
