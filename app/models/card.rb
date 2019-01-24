# == Schema Information
#
# Table name: cards
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  board_id    :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Card < ApplicationRecord
  belongs_to :board
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
end
