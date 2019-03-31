class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.integer :deck_id
      t.integer :user_id
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
