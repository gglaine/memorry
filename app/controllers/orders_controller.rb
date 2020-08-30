class OrdersController < ApplicationController
  def index
    @orders = Order.all

    all_purchases = []

    @orders.each do |item|
      price = item["unit_price"] * item["quantity"]
      item_price = price.round(2)
      all_purchases << item_price
    end

    @total_revenue = all_purchases.sum.round(0).to_s(:delimited)
    @unique_customers = @orders.uniq {|order| order.customer_id }.to_s(:delimited)
    @unique_orders = @orders.uniq {|order| order.order_id }.to_s(:delimited)

    react_rails_prerenderer

    render component: 'Summary', props: {
      orders: @orders,
      customers: @unique_customers,
      unique_orders: @unique_orders,
      total_revenue: @total_revenue
    }
  end
end
