class BixosController < ApplicationController

  # GET /bixos/new
  # GET /bixos/new.json
  def new
  	@bixo = Bixo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @bixo }
    end
  end

  # GET /bixos/1
  # GET /bixos/1.json
  def show
  	@bixo = Bixo.find(params[:id])
    @vendas = Venda.where(:bixo_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @bixo }
    end
  end

  # GET /bixos/1/edit
  # GET /bixos/1/edit.json
  def edit
    @bixo = Bixo.find(params[:id])
  end

  def index
  	@bixos = Bixo.order('nome ASC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @bixos }
    end
  end

   # POST /bixos
  # POST /bixos.json
  def create
    @bixo = Bixo.new(params[:bixo])

    respond_to do |format|
      if @bixo.save
        format.html { redirect_to @bixo, :notice => 'bixo was successfully created.' }
        format.json { render :json => @bixo, :status => :created, :location => @bixo }
      else
        format.html { render :action => "new" }
        format.json { render :json => @bixo.errors, :status => :unprocessable_entity }
      end
    end
   end

   # PUT /bixos/1
  # PUT /bixos/1.json
  def update
    @bixo = Bixo.find(params[:id])

    respond_to do |format|
      if @bixo.update_attributes(params[:bixo])
        format.html { redirect_to @bixo, :notice => 'bixo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @bixo.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /bixos/1
  # DELETE /bixos/1.json
  def destroy
    @bixo = Bixo.find(params[:id])
    @bixo.destroy

    respond_to do |format|
      format.html { redirect_to bixos_url }
      format.json { head :no_content }
    end
  end


end
