json.extract! produto, :id, :titulo, :image_url, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
