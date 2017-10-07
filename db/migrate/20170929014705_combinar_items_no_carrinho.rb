class CombinarItemsNoCarrinho < ActiveRecord::Migration[5.1]
  def up
    Carrinho.all.each do |carrinho|
      somas = carrinho.linha_items.group(:produto_id).sum(:quantidade)

      somas.each do |produto_id, quantidade|
        if quantidade > 1
          carrinho.linha_items.where(produto_id: produto_id).delete_all
          item = carrinho.linha_items.build(produto_id: produto_id)
          item.quantidade = quantidade
          item.save!
        end
      end
    end
  end

  def down
    LinhaItem.where("quantidade>1").each do |linha_item|
      linha_item.quantidade.times do
        LinhaItem.create(
          carrinho_id: linha_item.carrinho_id,
          produto_id: linha_item.produto_id,
          quantidade: 1
        )
      end

      linha_item.destroy
    end
  end
end
