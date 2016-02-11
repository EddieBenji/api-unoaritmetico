# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Operation.create!(name: 'addition')
Operation.create!(name: 'subtraction')
Operation.create!(name: 'multiplication')
Operation.create!(name: 'division')

Player.create!(name: 'Player 1')
Player.create!(name: 'Player 2')
Player.create!(name: 'Player 3')
Player.create!(name: 'Player 4')
Player.create!(name: 'MACHINE')