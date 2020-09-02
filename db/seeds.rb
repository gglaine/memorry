require 'json'

# read data from json in same dir
path = File.join(File.dirname(__FILE__), "./orders.json")
orders = JSON.parse(File.read(path))
# takes in the first 10 000 items to create orders
orders[1..10000].each do |order|
  Order.create!(order)
end

puts "Orders are seeded"
