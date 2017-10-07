require 'test_helper'

class LinhaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linha_item = linha_items(:one)
  end

  test "should get index" do
    get linha_items_url
    assert_response :success
  end

  test "should get new" do
    get new_linha_item_url
    assert_response :success
  end

  test "should create linha_item" do
    assert_difference('LinhaItem.count') do
      post linha_items_url, params: { linha_item: { carrinho_id: @linha_item.carrinho_id, produto_id: @linha_item.produto_id } }
    end

    assert_redirected_to linha_item_url(LinhaItem.last)
  end

  test "should show linha_item" do
    get linha_item_url(@linha_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_linha_item_url(@linha_item)
    assert_response :success
  end

  test "should update linha_item" do
    patch linha_item_url(@linha_item), params: { linha_item: { carrinho_id: @linha_item.carrinho_id, produto_id: @linha_item.produto_id } }
    assert_redirected_to linha_item_url(@linha_item)
  end

  test "should destroy linha_item" do
    assert_difference('LinhaItem.count', -1) do
      delete linha_item_url(@linha_item)
    end

    assert_redirected_to linha_items_url
  end

  test "should create line_item via ajax" do
    assert_difference('LinhaItem.count') do
      post linha_items_url, params: { produto_id: produtos(:ruby).id },
       xhr: true
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#corrente_item td', /Programming Ruby 1.9/
     end
  end
end
