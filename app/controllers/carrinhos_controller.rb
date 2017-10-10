class CarrinhosController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_carrinho, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :carrinho_invalido
  # GET /carrinhos
  # GET /carrinhos.json
  def index
    @carrinhos = Carrinho.all
  end

  # GET /carrinhos/1
  # GET /carrinhos/1.json
  def show
  end

  # GET /carrinhos/new
  def new
    @carrinho = Carrinho.new
  end

  # GET /carrinhos/1/edit
  def edit
  end

  # POST /carrinhos
  # POST /carrinhos.json
  def create
    @carrinho = Carrinho.new(carrinho_params)

    respond_to do |format|
      if @carrinho.save
        format.html { redirect_to @carrinho, notice: 'Carrinho was successfully created.' }
        format.json { render :show, status: :created, location: @carrinho }
      else
        format.html { render :new }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carrinhos/1
  # PATCH/PUT /carrinhos/1.json
  def update
    respond_to do |format|
      if @carrinho.update(carrinho_params)
        format.html { redirect_to @carrinho, notice: 'Carrinho was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :edit }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrinhos/1
  # DELETE /carrinhos/1.json
  def destroy
    @carrinho.destroy if @carrinho.id == session[:carrinho_id]
    session[:carrinho_id] = nil
    respond_to do |format|
      format.html { redirect_to loja_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrinho
      @carrinho = Carrinho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrinho_params
      params.fetch(:carrinho, {})
    end

    def carrinho_invalido
      logger.error "Tentativa de acessar carrinho invalido #{params[:id]}"
      redirect_to loja_index_url, notice: 'Carrinho inválido'
    end
end
