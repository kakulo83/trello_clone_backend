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

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should belong_to(:deck) }
  it { should have_many(:comments) }
	it { should belong_to(:creator) }
end
