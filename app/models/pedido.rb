class Pedido < ApplicationRecord
  has_many :linha_items, dependent: :destroy
  enum tipo_pagamento: {
    "Check"             => 0,
    "Cartao de credito" => 1,
    "Realizar pedido"   =>2
   }

  validates :nome, :endereco, :email, presence: true
  validates :tipo_pagamento, inclusion: tipo_pagamentos.keys

  def add_linha_items_do_carrinho(carrinho)
    carrinho.linha_items.each do |item|
      item.carrinho_id = nil
      linha_items << item
    end
  end
  
end
