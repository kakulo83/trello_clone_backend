class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.references :board, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
