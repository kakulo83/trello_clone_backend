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

require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
