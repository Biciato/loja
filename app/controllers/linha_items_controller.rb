class LinhaItemsController < ApplicationController
  include CarrinhoCorrente
  skip_before_action :authorize, only: :create
  before_action :set_carrinho, only: [:create]
  before_action :set_linha_item, only: [:show, :edit, :update, :destroy]

  # GET /linha_items
  # GET /linha_items.json
  def index
    @linha_items = LinhaItem.all
  end

  # GET /linha_items/1
  # GET /linha_items/1.json
  def show
  end

  # GET /linha_items/new
  def new
    @linha_item = LinhaItem.new
  end

  # GET /linha_items/1/edit
  def edit
  end

  # POST /linha_items
  # POST /linha_items.json
  def create
    redirect_to loja_index_url, notice: 'Linha item was successfully updated.'
    # produto = Produto.find(params[:produto_id])
    # @linha_item = @carrinho.adicionar_produto(produto)

    # respond_to do |format|
      # if @linha_item.save
        # format.html { redirect_to loja_index_url }
        # format.js { @corrente_item = @linha_item }
        # format.json { render :show,
          # status: :created, location: @linha_item }
      # else
        # format.html { render :new }
        # format.json { render json: @linha_item.errors,
          # status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /linha_items/1
  # PATCH/PUT /linha_items/1.json
  def update
    respond_to do |format|
      if @linha_item.update(linha_item_params)
        format.html { redirect_to @linha_item, notice: 'Linha item was successfully updated.' }
        format.json { render :show, status: :ok, location: @linha_item }
      else
        format.html { render :edit }
        format.json { render json: @linha_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linha_items/1
  # DELETE /linha_items/1.json
  def destroy
    @linha_item.destroy
    respond_to do |format|
      format.html { redirect_to linha_items_url, notice: 'Linha item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linha_item
      @linha_item = LinhaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linha_item_params
      params.require(:linha_item).permit(:produto_id)
    end
end
