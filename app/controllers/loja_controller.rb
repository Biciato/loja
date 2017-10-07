class LojaController < ApplicationController
include CarrinhoCorrente
before_action :set_carrinho
  def index
    @produtos = Produto.order(:titulo)
  end
end
