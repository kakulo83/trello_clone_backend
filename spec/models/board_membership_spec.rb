# == Schema Information
#
# Table name: board_memberships
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BoardMembership, type: :model do

end
