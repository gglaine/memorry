class Order < ApplicationRecord

  def price
    @unit_price = self.unit_price
    @quantity = self.quantity
    @unit_price * quantity
  end




end
