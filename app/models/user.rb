# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  account_id      :integer
#  role            :integer          default("user")
#  integer         :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  before_save  {email.downcase! }

  belongs_to :account
  has_many :board_memberships, dependent: :destroy
  has_many :boards, through: :board_memberships

  enum role: { user: 0, admin: 1, owner: 2 }

  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  def set_default_role
    self.role ||= :user
  end
end
