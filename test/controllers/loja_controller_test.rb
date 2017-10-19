require 'test_helper'

class LojaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loja_index_url
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.preco'
  end

end
