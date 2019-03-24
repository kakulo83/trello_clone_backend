# == Schema Information
#
# Table name: cards
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  deck_id     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :integer
#

class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :comments
end
