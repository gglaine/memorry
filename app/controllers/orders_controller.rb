class OrdersController < ApplicationController
  def index

    @orders = Order.all
    @orders_count = @orders.size.to_s

    @france_orders = Order.where(country: "France" )
    puts @france_orders.size.to_s + "orders in France"

    all_purchases = []
    all_orders = []

    tickets = @orders.group_by(&:order_id)

    tickets.each { |key, value| puts "k: #{key}, v: #{value}" }


    puts "Tickets size: " + tickets.size.to_s

    @number_of_tickets = tickets.size.to_s

    @orders.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      all_purchases << item_price
      all_orders << item
    end

    # SUM OF PRICE OF ALL ORDER ITEMS
    @total_revenue = all_purchases.sum.round(0)
    # UNIQUE CUSTOMERS
    @unique_customers = @orders.uniq {|order| order.customer_id }.size
    # UNIQUE ORDERS
    @unique_orders = @orders.uniq {|order| order.order_id }.size
    # NUMBER OF COUNTRIES
    @number_of_countries = @orders.uniq {|order| order.country }.size
    # AVERAGE REVENUE PER ORDER
    @average_revenue = @total_revenue.to_f / @unique_orders.to_f

    react_rails_prerenderer

    render component: 'Summary', props: {
      orders: @orders,
      orders_count: @orders_count,
      customers: @unique_customers,
      average_revenue: @average_revenue.round(2).to_s(:delimited),
      unique_orders: @unique_orders,
      total_revenue: @total_revenue,
      number_of_countries: @number_of_countries,
      number_of_tickets: @number_of_tickets
    }
  end
end
