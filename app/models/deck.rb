# == Schema Information
#
# Table name: decks
#
#  id         :bigint(8)        not null, primary key
#  board_id   :bigint(8)
#  title      :string
#  position   :integer
#  archived   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Deck < ApplicationRecord
  belongs_to :board
  has_many :cards
end
