class OrdersController < ApplicationController
  def index

    @orders = Order.all



    #######################################
    # ORDERS PLACED AT Q1/4
    qone_orders = []
    qtwo_orders = []
    qthree_orders = []
    qfour_orders = []
    # TODO replace with range of dates
    @qone = Order.where(id: 1 .. 2500)
    @qtwo = Order.where(id: 2501 .. 5000)
    @qthree = Order.where(id: 5001 .. 7500)
    @qfour = Order.where(id: 7501 .. 10000)

    @qone.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      qone_orders << item_price
    end

    @qtwo.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      qtwo_orders << item_price
    end

    @qthree.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      qthree_orders << item_price
    end

    @qfour.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      qfour_orders << item_price
    end

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

    # GET THE TOTAL PRICE OF ALL ORDER ITEMS (FLOAT)
    @total_revenue = all_purchases.sum.round(0)

    @qone_rev = qone_orders.sum.round(0)
    @qtwo_rev = qtwo_orders.sum.round(0)
    @qthree_rev = qthree_orders.sum.round(0)
    @qfour_rev = qfour_orders.sum.round(0)

    # GET NUMBER OF CUSTOMERS (INTEGER)
    @unique_customers = @orders.uniq {|order| order.customer_id }.size
    # UNIQUE ORDERS SIZE (INTEGER)
    @unique_orders = @orders.uniq {|order| order.order_id }.size
    # NUMBER OF COUNTRIES(INTEGER)
    @number_of_countries = @orders.uniq {|order| order.country }.size
    # AVERAGE REVENUE PER ORDER (FLOAT)
    @average_revenue = @total_revenue.to_f / @unique_orders.to_f

    # @france_orders = Order.where(country: "France" )
    react_rails_prerenderer

  end
end
