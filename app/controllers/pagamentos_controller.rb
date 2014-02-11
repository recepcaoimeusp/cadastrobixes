class PagamentosController < ApplicationController
  def new
    @pagamento = Pagamento.new
    @veteranos = Veterano.order('nome ASC').all

    @pagamento.venda = Venda.find(params[:venda])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pagamento }
    end
  end

  def edit
    @pagamento = Pagamento.find(params[:id])
    @veteranos = Veterano.order('nome ASC').all
  end

  def create
    @pagamento = Pagamento.new(params[:pagamento])

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to @pagamento.venda, :notice => 'Pagamento was successfully created.' }
        format.json { render :json => @pagamento, :status => :created, :location => @pagamento }
      else
        format.html { render :action => "new" }
        format.json { render :json => @pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @pagamento = Pagamento.find(params[:id])
    venda_id = @pagamento.venda_id

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        format.html {
          redirect_to Venda.find(venda_id),
          :notice => 'Pagamento was successfully updated.'
        }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json {
          render :json => @pagamento.errors,
          :status => :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @pagamento = Pagamento.find(params[:id])
    venda = @pagamento.venda
    @pagamento.destroy

    respond_to do |format|
      format.html { redirect_to venda }
      format.json { head :no_content }
    end
  end

end
