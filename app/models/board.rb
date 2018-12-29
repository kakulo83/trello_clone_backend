# == Schema Information
#
# Table name: boards
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  belongs_to :account
  has_one :owner, through: :account
end
