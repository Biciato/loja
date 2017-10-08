# Preview all emails at http://localhost:3000/rails/mailers/pedido_mailer
class PedidoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pedido_mailer/recebido
  def recebido
    PedidoMailer.recebido
  end

  # Preview this email at http://localhost:3000/rails/mailers/pedido_mailer/despachado
  def despachado
    PedidoMailer.despachado
  end

end
