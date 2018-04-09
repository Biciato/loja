class Carrinho < ApplicationRecord
  has_many :linha_items, dependent: :destroy

  # method that adds a product to a cart
  def adicionar_produto(produto)
    corrente_item = linha_items.find_by(produto_id: produto.id)
    if corrente_item
      corrente_item.quantidade +=1
    else
      corrente_item = linha_items.build(produto_id: produto.id)
    end
    corrente_item
  end

  def preco_total
    linha_items.to_a.sum { |item| item.preco_total }
  end
end
