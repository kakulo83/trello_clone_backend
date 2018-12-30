class CreateBoardMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :board_memberships do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
