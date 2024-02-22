class BixesController < ApplicationController
  before_action :set_bixe, only: [:show, :edit, :update, :destroy, :modalidades,
                                  :modify_modalidades, :items, :modify_items]

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD'], only: [:emails]

  # GET /bixes
  # GET /bixes.json
  def index
    @bixes = Bixe.all
  end

  # GET /bixes/emails
  # GET /bixes/emails.json
  def emails
    @emails = Bixe.all.map(&:email).uniq
  end

  # GET /bixes/1
  # GET /bixes/1.json
  def show
  end

  # GET /bixos/new
  def new
    @bixe = Bixe.new
  end

  # GET /bixos/1/edit
  def edit
  end

  # GET /bixos/1/modalidades
  def modalidades
    @check = {}
    @bixe.modalidades.each do |m|
      @check[m.id] = true
    end
  end

  # GET /bixos/1/items
  def items
    @quantities = {}
    @bixe.bixe_items.each do |i|
      @quantities[i.item_id] = i.quantity 
    end
  end


  # GET /bixos/contatos
  def contatos
    @bixes = Bixe.all
  end

  # POST /bixos/1/modalidades
  def modify_modalidades
    @bixe.modalidades = modalidades_params.to_hash.map { |k,v| Modalidade.find(k) }
    respond_to do |format|
      if @bixe.save
        format.html { redirect_to @bixe, notice: 'Modalidades modificadas com sucesso!' }
        format.json { render :show, status: :created, location: @bixe }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :new }
        format.json { render json: @bixe.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /bixos/1/items
  def modify_items
    items_params.each do |item_id, quantity| 
      bixe_item = @bixe.bixe_items.find_or_create_by(item_id: item_id)
      if quantity.to_i > 0
        already_bought = BixeItem.where(item_id: item_id).map(&:quantity).sum - bixe_item.quantity
        item = Item.find(item_id)
        if quantity.to_i > item.quantidade - already_bought
          flash[:error] = "Não há quantidade suficiente do item #{item.nome} em estoque"
          redirect_to action: "items", id: @bixe.id and return
        end
        
        bixe_item.quantity = quantity  
        bixe_item.save
      else
        bixe_item.destroy
      end
    end

    respond_to do |format|
      if @bixe.save
        format.html { redirect_to @bixe, notice: 'Itens modificados com sucesso!' }
        format.json { render :show, status: :created, location: @bixe }
      else
        format.html { flash[:error] = 'Deu caca em alguma coisa'; render :new }
        format.json { render json: @bixe.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /bixos
  # POST /bixos.json
  def create
    @bixe = Bixe.new(bixe_params)

    respond_to do |format|
      if @bixe.save
        format.html { redirect_to @bixe, notice: 'bixe criado com sucesso!' }
        format.json { render :show, status: :created, location: @bixe }
      else
        format.html { flash[:error] = 'Preencha todos os dados!'; render :new }
        format.json { render json: @bixe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bixos/1
  # PATCH/PUT /bixos/1.json
  def update
    respond_to do |format|
      if @bixe.update(bixe_params)
        format.html { redirect_to @bixe, notice: 'bixe atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @bixe }
      else
        format.html { render :edit }
        format.json { render json: @bixe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bixos/1
  # DELETE /bixos/1.json
  def destroy
    @bixe.destroy
    respond_to do |format|
      format.html { redirect_to bixes_url, notice: 'bixe apagado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bixe
      @bixe = Bixe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bixe_params
      params[:bixe][:curso] = params[:bixe][:curso].to_i
      params.require(:bixe).permit(:nome, :email, :telefone, :curso)
    end

    def modalidades_params
      if params[:modalidades].nil? or params[:modalidades].empty?
        params[:modalidades] = {}
      else
        params.require(:modalidades).permit!
      end
    end

    def items_params
      if params[:items].nil? or params[:items].empty?
        params[:items] = {}
      else
        params.require(:items).permit!
      end
    end
end
