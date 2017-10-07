require 'test_helper'

class CarrinhosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrinho = carrinhos(:one)
  end

  test "should get index" do
    get carrinhos_url
    assert_response :success
  end

  test "should get new" do
    get new_carrinho_url
    assert_response :success
  end

  test "should create carrinho" do
    assert_difference('Carrinho.count') do
      post carrinhos_url, params: { carrinho: {  } }
    end

    assert_redirected_to carrinho_url(Carrinho.last)
  end

  test "should show carrinho" do
    get carrinho_url(@carrinho)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrinho_url(@carrinho)
    assert_response :success
  end

  test "should update carrinho" do
    patch carrinho_url(@carrinho), params: { carrinho: {  } }
    assert_redirected_to carrinho_url(@carrinho)
  end

  test "should destroy carrinho" do
    assert_difference('Carrinho.count', -1) do
      delete carrinho_url(@carrinho)
    end

    assert_redirected_to carrinhos_url
  end
end
