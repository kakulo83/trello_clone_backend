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
account.save

# CREATE OWNER AND ADMINS AND REGULAR USERS
owner = User.create(name: "Mr Owner",
                    email: "owner@test.net",
                    role: :owner,
                    password: "foobar",
                    password_confirmation: "foobar")
owner.account = account
owner.save

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

10.times do
  password = Faker::Internet.password(min_length = 8)
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              account: account,
              password: password,
              password_confirmation: password)
end


# CREATE BOARD
board = Board.create(title: "Home duties", account: account)

deck1 = Deck.create(title: "todos", board: board, position: 1)

card1 = Card.create(title: "Buy some drugs",
                    description: "get things done",
                    deck: deck1,
                    position: 1,
                    creator: User.last)

card2 = Card.create(title: "Build out table",
                    description: "Table for cooking",
                    deck: deck1,
                    position: 2,
                    creator: User.first)


# CREATE MEMBERSHIPS TO BOARD
BoardMembership.create(user: owner,  board: board)
BoardMembership.create(user: admin1, board: board)
BoardMembership.create(user: admin2, board: board)
