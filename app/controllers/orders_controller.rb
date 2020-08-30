class OrdersController < ApplicationController
  def index
    @orders = Order.all
    react_rails_prerenderer
    render component: 'Summary', props: { orders: @orders }
  end
end
