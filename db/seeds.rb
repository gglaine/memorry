# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'


path = File.join(File.dirname(__FILE__), "./orders.json")
orders = JSON.parse(File.read(path))
orders[1..10000].each do |order|
  Order.create!(order)
end

puts "Orders are seeded"
