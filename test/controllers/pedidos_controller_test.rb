require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get pedidos_url
    assert_response :success
  end

  test "requer items no carrinho" do
    get new_pedido_url
    assert_redirected_to loja_index_path
    assert_equal flash[:notice], 'Seu carrinho está vazio'
  end

  test "should get new" do
    post linha_items_url, params: { produto_id: produtos(:ruby).id }

    get new_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: { pedido: { email: @pedido.email,
        endereco: @pedido.endereco, nome: @pedido.nome,
         tipo_pagamento: @pedido.tipo_pagamento } }
    end

    assert_redirected_to loja_index_path
  end

  test "should show pedido" do
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: { pedido: { email: @pedido.email, endereco: @pedido.endereco, nome: @pedido.nome, tipo_pagamento: @pedido.tipo_pagamento } }
    assert_redirected_to pedido_url(@pedido)
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete pedido_url(@pedido)
    end

    assert_redirected_to pedidos_url
  end
end
