require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    leandro = usuarios(:one)
    post login_url, params: { nome: leandro.nome, password: 'secret'}
    assert_redirected_to admin_url
    assert_equal leandro.id, session[:usuario_id]
  end

  test "should fail login" do
    leandro = usuarios(:one)
    post login_url, params: { nome: leandro.nome, password: 'wrong'}
    assert_redirected_to login_url
  end

end
