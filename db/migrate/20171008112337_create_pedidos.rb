class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.string :nome
      t.text :endereco
      t.string :email
      t.integer :tipo_pagamento

      t.timestamps
    end
  end
end
