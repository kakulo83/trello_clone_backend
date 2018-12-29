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

require 'rails_helper'

RSpec.describe Board, type: :model do

  it { should belong_to(:account) }

  it { should have_and_belong_to_many(:users) }

  it { should have_one(:team) }

  it 'has a name', board: true do

  end

  it 'has at least one admin' do

  end

end
