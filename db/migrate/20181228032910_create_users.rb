class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :account_id, foreign_key: true
      t.integer :role, :integer, default: 0
      t.timestamps
    end
  end
end
