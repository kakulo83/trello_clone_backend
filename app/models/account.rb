# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
  has_many :users
end
