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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { create(:comment) }

  it { should belong_to(:user) }
  it { should belong_to(:card) }

  it "has a text" do
    expect(subject.text).not_to be_empty
  end
end
