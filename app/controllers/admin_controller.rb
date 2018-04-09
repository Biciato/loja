class AdminController < ApplicationController
  # return the total price of the products
  def index
    @total_pedidos = Pedido.count
  end
end
