# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  owner_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
  belongs_to :owner, -> { where role: :owner }, class_name: 'User', optional: true
  has_many :admins, dependent: :destroy, class_name: 'User'
  has_many :users, dependent: :destroy
  has_many :boards, dependent: :destroy
end
