# == Schema Information
#
# Table name: owners
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Owner < ApplicationRecord
  belongs_to :account
end
