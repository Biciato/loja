atom_feed do |feed|
  feed.titulo "Quem comprou #{@produto.titulo}"

  feed.updated @ultimo_pedido.try(:updated_at)

  @produto.pedidos.each do |pedido|
    feed.entry(pedido) do |entry|
      entry.titulo "Pedido #{pedido.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Enviado para #{pedido.endereco}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'Produto'
            xhtml.th 'Quantidade'
            xhtml.th 'Preço Total'
          end
          pedido.linha_items.each do |item|
            xhtml.tr do
              xhtml.td item.produto.titulo
              xhtml.td item.quantidade
              xhtml.td number_to_currency_br item.preco_total
            end
          end
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency_br \
              pedido.linha_items.map(&:preco_total).sum
          end
        end

        xhtml.p "Pago como #{pedido.tipo_pagamento}"
      end
      entry.author do |author|
        author.nome pedido.nome
        author.email pedido.email
      end
    end
  end
end
