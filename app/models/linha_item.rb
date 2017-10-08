class LinhaItem < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :produto, optional: true
  belongs_to :carrinho

  def preco_total
    produto.preco * quantidade
  end
end
