# == Schema Information
#
# Table name: boards
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  belongs_to :account
  has_one :owner, through: :account
  has_many :board_memberships
  has_many :admins, -> { where(users: { role: "admin" }) },
    class_name: "User",
    through: :board_memberships,
    source: :user
  has_many :users, through: :board_memberships
  has_many :decks
  has_many :cards, through: :decks

  accepts_nested_attributes_for :cards
end
