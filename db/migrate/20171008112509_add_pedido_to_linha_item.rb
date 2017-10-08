class AddPedidoToLinhaItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :linha_items, :pedido, foreign_key: true
  end
end
