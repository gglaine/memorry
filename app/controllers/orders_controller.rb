class OrdersController < ApplicationController
  def index

    @orders = Order.all
    @orders_count = @orders.size.to_s
    # Array with all prices for each order-item
    all_purchases = []
    # Array with all orders grouped by order_id
    all_orders = []
    # Group order-items by ticket (order)
    tickets = @orders.group_by(&:order_id)
    # GET NUMBER OF TICKETS
    @number_of_tickets = tickets.size.to_s
    tickets.each_with_object("ticket") do |item, obj|
      puts "#{obj} objet: #{item}"
      puts "---------------"
    end


    # Compute price of each individual order-item
    @orders.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      # add rounded price to array of all prices
      all_purchases << item_price
      # all_orders << item
    end

    # GET THE TOTAL PRICE OF ALL ORDER ITEMS
    @total_revenue = all_purchases.sum.round(0)
    # GET NUMBER OF CUSTOMERS
    @unique_customers = @orders.uniq {|order| order.customer_id }.size
    # UNIQUE ORDERS
    @unique_orders = @orders.uniq {|order| order.order_id }.size
    # NUMBER OF COUNTRIES
    @number_of_countries = @orders.uniq {|order| order.country }.size
    # AVERAGE REVENUE PER ORDER
    @average_revenue = @total_revenue.to_f / @unique_orders.to_f

    # @france_orders = Order.where(country: "France" )
    react_rails_prerenderer
  end
end
