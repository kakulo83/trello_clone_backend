class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
