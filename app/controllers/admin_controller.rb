class AdminController < ApplicationController
  def index
    @total_pedidos = Pedido.count
  end
end
