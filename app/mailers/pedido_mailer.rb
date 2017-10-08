class PedidoMailer < ApplicationMailer
  default from: 'Leandro Biciato <loja@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pedido_mailer.recebido.subject
  #
  def recebido(pedido)
    @pedido = pedido

    mail to: pedido.email, subject: "Confirmação de pedido da FG Games"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pedido_mailer.despachado.subject
  #
  def despachado(pedido)
    @pedido = pedido

    mail to: pedido.email, subject: "Pedido da FG Games despachado"
  end
end
