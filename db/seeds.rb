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

me = User.create(name: "Robert Carter",
                 email: "kakulo83@gmail.com",
                 account_id: account.id,
                 password: "greekboy",
                 password_confirmation: "greekboy")


account.me = me
me.account = account

account.save
me.save

10.times do
  password = Faker::Internet.password(min_length = 8)
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              account: account,
              password: password,
              password_confirmation: password)
end

board = Board.create(name: "todos", account: account)

pass1 = Faker::Internet.password(min_length = 8)
admin1 = User.create(name: "Admin1",
                     email: "admin1@test.net",
                     role: :admin,
                     account: account,
                     password: pass1,
                     password_confirmation: pass1)

pass2 = Faker::Internet.password(min_length = 8)
admin2 = User.create(name: "Admin2",
                     email: "admin2@test.net",
                     role: :admin,
                     account: account,
                     password: pass2,
                     password_confirmation: pass2)

BoardMembership.create(user: admin1, board: board)
BoardMembership.create(user: admin2, board: board)

card1 = Card.create(title: "card thing 1",
                    description: "get things done",
                    board: board,
                    creator: User.last)
