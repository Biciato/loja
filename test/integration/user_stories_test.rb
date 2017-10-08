require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :produtos

  start_order_count = Pedido.count
  ruby_book = produtos(:ruby)

  get "/"
  assert_responde :sucess
  assert_select 'h1', 'Your Pragmatic Catalog'

  post '/linha_items', params: { produto_id: ruby_book.id }, xhr: true
  assert_responde :sucess

  carrinho = Carrinho.find(session[:carrinho_id])
  assert_equal 1, carrinho.linha_items.size
  assert_equal ruby_book, carrinho.linha_items[0].produto

  get "/pedidos/new"
  assert_responde :sucess
  assert_select 'legend', 'Por favor, entre seus detalhes'

  post "/pedidos", params: {
    pedido: {
      nome: "Dave Thomas",
      endereco: "123 The Street",
      email: "dave@example.com",
      tipo_pagamento: "Check"
    }
  }

  follow_redirect!

  assert_response :success
  assert_select 'h1', "Your Pragmatic Catalog"
  carrinho = Carrinho.find(session[:cart_id])
  assert_equal 0, carrinho.linha_items.size

  assert_equal start_pedido_count + 1, Pedido.count
  pedido = Pedido.last

  assert_equal "Dave Thomas", pedido.nome
  assert_equal "123 The Street", pedido.endereco
  assert_equal "dave@example.com", pedido.email
  assert_equal "Check", pedido.tipo_pagamento

  assert_equal 1, pedido.linha_items.size
  line_item = pedido.linha_items[0]
  assert_equal ruby_book, linha_item.produto

  mail = ActionMailer::Base.deliveries.last
  assert_equal ["dave@example.com"], mail.to
  assert_equal 'Leandro Biciato <loja@example.com>', mail[:from].value
  assert_equal "Confirmação de pedido da FG Games", mail.subject
  # test "the truth" do
  #   assert true
  # end
end
