require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto = produtos(:one)
    @update = {
      titulo: 'Lorem Ipsum',
      image_url: 'lorem.jpg',
      preco: 19.95
    }
  end

  test "can't delete product in cart" do
    assert_difference('Produto.count', 0) do
      delete produtos_url(produtos(:two))
    end
    assert_redirected_to produtos_url
  end

  test "should destroy produto" do
    assert_difference('Produto.count', -1) do
        delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end
