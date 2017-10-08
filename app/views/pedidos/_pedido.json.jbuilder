json.extract! pedido, :id, :nome, :endereco, :email, :tipo_pagamento, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
