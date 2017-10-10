class LojaController < ApplicationController
include CarrinhoCorrente
skip_before_action :authorize
before_action :set_carrinho
  def index
    @produtos = Produto.order(:titulo)
  end
end
