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

require 'rails_helper'

RSpec.describe Deck, type: :model do

  subject(:deck) { create(:deck) }

  it { should belong_to(:board) }
  it { should have_many(:cards) }

  it "title should be present" do
    expect(subject.title).not_to be_empty
  end

end
