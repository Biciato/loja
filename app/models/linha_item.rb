class LinhaItem < ApplicationRecord
  belongs_to :produto
  belongs_to :carrinho

  def preco_total
    produto.preco * quantidade
  end
end
