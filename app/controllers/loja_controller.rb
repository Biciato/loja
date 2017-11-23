class LojaController < ApplicationController
include CarrinhoCorrente
# skip_before_action :authorize
before_action :set_carrinho
  def index
    if params[:set_locale]
      redirect_to loja_index_url(locale: params[:set_locale])
    else
      @produtos = Produto.order(:titulo)
    end
  end
end
