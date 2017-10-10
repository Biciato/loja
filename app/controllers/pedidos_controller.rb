class PedidosController < ApplicationController
  include CarrinhoCorrente
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_carrinho, only: [:new, :create]
  before_action :assegure_carrinho_nao_esta_vazio, only: :new
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.add_linha_items_do_carrinho(@carrinho)

    respond_to do |format|
      if @pedido.save
        Carrinho.destroy(session[:carrinho_id])
        session[:carrinho_id] = nil
        PedidoMailer.recebido(@pedido).deliver_later
        format.html { redirect_to loja_index_url,
          notice: I18n.t('.obrigado') }
        format.json { render :show, status: :created,
          location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:nome, :endereco, :email, :tipo_pagamento)
    end

    def assegure_carrinho_nao_esta_vazio
      if @carrinho.linha_items.empty?
        redirect_to loja_index_url, notice: 'Seu carrinho está vazio'
      end
    end
end
