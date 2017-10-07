json.extract! linha_item, :id, :produto_id, :carrinho_id, :created_at, :updated_at
json.url linha_item_url(linha_item, format: :json)
