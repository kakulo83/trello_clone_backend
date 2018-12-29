# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  account_id :integer
#  role       :integer          default("user")
#  integer    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  belongs_to :account

  enum role: { user: 0, admin: 1, owner: 2 }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
