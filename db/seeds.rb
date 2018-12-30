# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

account = Account.new(name: "test_account")

owner = User.create(name: "Mr Owner", email: "owner@test.net", role: :owner, account_id: account)

account.owner = owner
owner.account = account

account.save
owner.save

10.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              account: account)
end

board = Board.create(name: "todos", account: account)

admin1 = User.create(name: "Admin1", email: "admin1@test.net", role: :admin, account: account)
admin2 = User.create(name: "Admin2", email: "admin2@test.net", role: :admin, account: account)

BoardMembership.create(user: admin1, board: board)
BoardMembership.create(user: admin2, board: board)
