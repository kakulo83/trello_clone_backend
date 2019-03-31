# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  text       :string
#  user_id    :bigint(8)
#  card_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card
end
