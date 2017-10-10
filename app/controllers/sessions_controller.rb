class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    usuario = Usuario.find_by(nome: params[:nome])
    if usuario.try(:authenticate, params[:password])
      session[:usuario_id] = usuario.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Combinação Usuario/password inválido"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to loja_index_url, notice: "Usuário deslogado"
  end
end
