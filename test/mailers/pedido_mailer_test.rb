require 'test_helper'

class PedidoMailerTest < ActionMailer::TestCase
  test "recebido" do
    mail = PedidoMailer.recebido(pedidos(:one))
    assert_equal "Confirmação de pedido da FG Games", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["loja@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "despachado" do
    mail = PedidoMailer.despachado(pedidos(:one))
    assert_equal "Pedido da FG Games despachado", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["loja@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
     mail.body.encoded
  end

end
